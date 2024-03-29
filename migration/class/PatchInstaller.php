<?php

namespace Sunlight\Migrator;

use Sunlight\Database\Database as DB;
use Sunlight\Database\SqlReader;

require __DIR__ . '/CustomDatabaseLoader.php';

abstract class PatchInstaller
{
    /** @var bool|null */
    private $installed;

    final function isInstalled(): bool
    {
        if ($this->installed === null) {
            $this->installed = $this->verify();
        }

        return $this->installed;
    }

    /**
     * @throws \LogicException if the migration has already been done
     */
    final function install(): bool
    {
        if ($this->isInstalled()) {
            throw new \LogicException('The migration has already been done');
        }

        $this->installed = null;
        $this->doInstall();
        return $this->isInstalled();
    }

    /**
     * Returns TRUE if the migration has already been done, FALSE otherwise.
     */
    abstract protected function verify(): bool;

    abstract protected function doInstall(): void;


    /**
     * Check that all given database tables exist
     *
     * @param string[] $tables list of table names (with prefixes)
     * @return string[] list of missing tables
     * @throws \RuntimeException if only some tables exist
     */
    protected function checkTables(array $tables): array
    {
        $foundTables = [];

        foreach ($tables as $table) {
            if (DB::queryRow('SHOW TABLES LIKE ' . DB::val($table)) !== false) {
                $foundTables[] = $table;
            }
        }

        return array_diff($tables, $foundTables);
    }

    /**
     * Check that all given database table columns exist
     *
     * @param string $table table name (with prefix)
     * @param string[] $columns column names
     * @return string[] list of missing columns
     */
    protected function checkColumns(string $table, array $columns): array
    {
        $foundColumns = [];

        foreach ($columns as $column) {
            if (DB::queryRow('SHOW COLUMNS FROM ' . DB::escIdt($table) . ' LIKE ' . DB::val($column)) !== false) {
                $foundColumns[] = $column;
            }
        }

        return array_diff($columns, $foundColumns);
    }

    /**
     * Drop all given database tables
     *
     * @param string[] $tables list of table names (with prefixes)
     */
    protected function dropTables(array $tables): void
    {
        DB::query('DROP TABLE IF EXISTS ' . DB::idtList($tables));
    }

    /**
     * Load a SQL dump
     *
     * @param string $path path to the .sql file
     * @param string|null $currentPrefix prefix that is used in the dump (null = do not replace)
     */
    protected function loadSqlDump(string $path, ?string $currentPrefix = 'sunlight_', bool $fromOld = false): void
    {
        $newPrefix = $fromOld ? substr_replace(DB::$prefix, '', -1) : DB::$prefix;
        CustomDatabaseLoader::load(
            SqlReader::fromFile($path),
            $currentPrefix,
            $currentPrefix !== null
                ? $newPrefix
                : null
        );
    }
}