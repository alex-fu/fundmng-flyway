create table `admins` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`username` VARCHAR(255) NOT NULL,`password` VARCHAR(255) NOT NULL,`name` VARCHAR(255) NOT NULL,`email` VARCHAR(127) NOT NULL,`created_at` BIGINT NOT NULL,`updated_at` BIGINT NOT NULL);
create unique index `idx_username` on `admins` (`username`);
create table `groups` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`group_name` VARCHAR(255) NOT NULL,`group_type` VARCHAR(127) NOT NULL);
create unique index `idx_groupname` on `groups` (`group_name`);
create table `authorities` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`authority_name` VARCHAR(255) NOT NULL);
create table `authority_group_mappings` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`authority_id` INTEGER NOT NULL,`group_id` INTEGER NOT NULL);
alter table `authority_group_mappings` add constraint `AG_AUTHID_FK` foreign key(`authority_id`) references `authorities`(`id`) on update RESTRICT on delete CASCADE;
alter table `authority_group_mappings` add constraint `AG_GRPID_FK` foreign key(`group_id`) references `groups`(`id`) on update RESTRICT on delete CASCADE;
create table `group_admin_mappings` (`id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,`group_id` INTEGER NOT NULL,`admin_id` INTEGER NOT NULL);
alter table `group_admin_mappings` add constraint `GA_GRPID_FK` foreign key(`group_id`) references `groups`(`id`) on update RESTRICT on delete CASCADE;
alter table `group_admin_mappings` add constraint `GA_USRID_FK` foreign key(`admin_id`) references `admins`(`id`) on update RESTRICT on delete CASCADE;
