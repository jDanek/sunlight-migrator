ALTER TABLE `sunlight_article`
    CHANGE COLUMN `title_seo` `slug` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    CHANGE COLUMN `readed` `view_count` INT(11) NOT NULL DEFAULT 0 AFTER `showinfo`;

ALTER TABLE `sunlight_article`
    CHANGE COLUMN `title` `title` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    CHANGE COLUMN `description` `description` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    CHANGE COLUMN `perex` `perex` TEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    CHANGE COLUMN `picture_uid` `picture_uid` VARCHAR(32) COLLATE utf8mb4_unicode_ci NULL,
    CHANGE COLUMN `content` `content` MEDIUMTEXT COLLATE utf8mb4_unicode_ci NOT NULL,
    CHANGE COLUMN `home2` `home2` INT(11) NOT NULL DEFAULT -1,
    CHANGE COLUMN `home3` `home3` INT(11) NOT NULL DEFAULT -1,
    CHANGE COLUMN `time` `time` BIGINT(20) NOT NULL,
    CHANGE COLUMN `visible` `visible` TINYINT(1) NOT NULL DEFAULT 1,
    CHANGE COLUMN `public` `public` TINYINT(1) NOT NULL DEFAULT 1,
    CHANGE COLUMN `comments` `comments` TINYINT(1) NOT NULL DEFAULT 1,
    CHANGE COLUMN `commentslocked` `commentslocked` TINYINT(1) NOT NULL DEFAULT 0,
    CHANGE COLUMN `confirmed` `confirmed` TINYINT(1) NOT NULL DEFAULT 0,
    CHANGE COLUMN `showinfo` `showinfo` TINYINT(1) NOT NULL DEFAULT 1,
    CHANGE COLUMN `rateon` `rateon` TINYINT(1) NOT NULL DEFAULT 1,
    CHANGE COLUMN `ratenum` `ratenum` INT(11) NOT NULL DEFAULT 0,
    CHANGE COLUMN `ratesum` `ratesum` INT(11) NOT NULL DEFAULT 0,
    CHANGE COLUMN `slug` `slug` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    ADD `search_content` text COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `content`,
    DROP COLUMN `keywords`,
    DROP COLUMN `infobox`;
