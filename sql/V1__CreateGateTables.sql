create table `admins` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`loginName` VARCHAR(255) NOT NULL,`password` VARCHAR(255) NOT NULL,`adminName` VARCHAR(255) NOT NULL,`email` VARCHAR(127) NOT NULL,`wxid` TEXT,`created_at` BIGINT NOT NULL,`updated_at` BIGINT);
create unique index `idx_loginName` on `admins` (`loginName`);
create table `groups` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`group_name` VARCHAR(255) NOT NULL,`group_type` VARCHAR(127) NOT NULL);
create unique index `idx_groupname` on `groups` (`group_name`);
create table `authorities` (`authority_name` VARCHAR(255) NOT NULL PRIMARY KEY,`authority_label` VARCHAR(255) NOT NULL,`expressions` TEXT);
create table `authority_group_mappings` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`authority_name` VARCHAR(255) NOT NULL,`group_id` INTEGER NOT NULL);
create unique index `idx_authoritygroup` on `authority_group_mappings` (`authority_name`,`group_id`);
alter table `authority_group_mappings` add constraint `AG_GRPID_FK` foreign key(`group_id`) references `groups`(`id`) on update RESTRICT on delete CASCADE;
create table `group_admin_mappings` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`group_id` INTEGER NOT NULL,`admin_id` INTEGER NOT NULL);
create unique index `idx_groupadmin` on `group_admin_mappings` (`group_id`,`admin_id`);
alter table `group_admin_mappings` add constraint `GA_ADMID_FK` foreign key(`admin_id`) references `admins`(`id`) on update RESTRICT on delete CASCADE;
alter table `group_admin_mappings` add constraint `GA_GRPID_FK` foreign key(`group_id`) references `groups`(`id`) on update RESTRICT on delete CASCADE;
create table `access_records` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`time` VARCHAR(31) NOT NULL,`uri` VARCHAR(255) NOT NULL,`method` CHAR(15) NOT NULL,`who` VARCHAR(127),`from` VARCHAR(31),`jwt` TEXT,`response_status` INTEGER NOT NULL)