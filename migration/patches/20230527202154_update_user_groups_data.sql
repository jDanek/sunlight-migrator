UPDATE `sunlight_user_group` SET `adminpages`=1 WHERE id=1 OR adminsection=1 OR admincategory=1 OR adminbook=1 OR adminseparator=1 OR admingallery=1 OR adminlink=1 OR admingroup=1 OR adminforum=1 OR adminpluginpage=1;
UPDATE `sunlight_user_group` SET `fileglobalaccess`=-1, `adminautoconfirm`=-1 WHERE fileglobalaccess=0;
UPDATE `sunlight_user_group` SET `fileglobalaccess`=0, `adminautoconfirm`=0 WHERE fileglobalaccess=1;
UPDATE `sunlight_user_group` SET `fileglobalaccess`=1, `adminautoconfirm`=1 WHERE fileglobalaccess=-1;
UPDATE `sunlight_user_group` SET `blocked`=0, `reglist`=0, `administration`=0, `adminsettings`=0, `adminplugins`=0, `adminusers`=0, `admingroups`=0, `admincontent`=0, `adminother`=0, `adminpages`=0, `adminsection`=0, `admincategory`=0, `adminbook`=0, `adminseparator`=0, `admingallery`=0, `adminlink`=0, `admingroup`=0, `adminforum`=0, `adminpluginpage`=0, `adminart`=0, `adminallart`=0, `adminchangeartauthor`=0, `adminconfirm`=0, `adminautoconfirm`=0, `adminpoll`=0, `adminpollall`=0, `adminsbox`=0, `adminbox`=0, `fileaccess`=0, `fileglobalaccess`=0, `fileadminaccess`=0, `adminhcm`='', `adminhcmphp`=0, `adminbackup`=0, `adminmassemail`=0, `adminposts`=0, `changeusername`=0, `postcomments`=1, `unlimitedpostaccess`=0, `locktopics`=0, `stickytopics`=0, `movetopics`=0, `artrate`=1, `pollvote`=1, `selfremove`=0 WHERE id=2;
UPDATE `sunlight_user_group` SET `adminhcm`='*', `adminplugins`=1 WHERE id=1;
UPDATE `sunlight_user_group` SET `adminother`=1 WHERE id=1 OR adminbackup=1 OR adminmassemail=1;

UPDATE `sunlight_user_group` SET `adminautoconfirm`=0, `fileglobalaccess`=0 WHERE id=3
UPDATE `sunlight_user_group` SET `adminhcm`='poll, gallery, linkart, linkpage' WHERE id=6