-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_agents
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_agents`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_agents` (
  `id`                        int(11)                                           NOT NULL AUTO_INCREMENT,
  `name`                      varchar(255)                                      NOT NULL DEFAULT '',
  `version`                   varchar(255)                                      NOT NULL DEFAULT '',
  `computers_id`              int(11)                                           NOT NULL DEFAULT '0',
  `users_id`                  int(11)                                           NOT NULL DEFAULT '0',
  `wipe`                      tinyint(1)                                        NOT NULL DEFAULT '0',
  `lock`                      tinyint(1)                                        NOT NULL DEFAULT '0',
  `enroll_status`             enum('enrolled','unenrolling','unenrolled')       NOT NULL DEFAULT 'enrolled',
  `entities_id`               int(11)                                           NOT NULL DEFAULT '0',
  `plugin_flyvemdm_fleets_id` int(11)                                           DEFAULT NULL,
  `last_report`               datetime                                          DEFAULT NULL,
  `last_contact`              datetime                                          DEFAULT NULL,
  `is_online`                 tinyint(1)                                        NOT NULL DEFAULT '0',
  `certificate`               text                                              NOT NULL,
  `mdm_type`                  enum('android','apple')                           NOT NULL DEFAULT 'android',
  `has_system_permission`     tinyint(1)                                        NOT NULL DEFAULT '0',
  `notification_type`         varchar(255)                                      NOT NULL DEFAULT 'mqtt',
  `notification_token`        varchar(255)                                      NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`),
  KEY `users_id` (`users_id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_entityconfigs
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_entityconfigs`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_entityconfigs` (
  `id`                        int(11)                                           NOT NULL DEFAULT '0',
  `entities_id`               int(11)                                           NOT NULL DEFAULT '0',
  `enroll_token`              varchar(255)                                      DEFAULT NULL,
  `agent_token_life`          varchar(255)                                      DEFAULT 'P7D',
  `support_name`              varchar(255)                                      DEFAULT NULL,
  `support_phone`             varchar(255)                                      DEFAULT NULL,
  `support_website`           varchar(255)                                      DEFAULT NULL,
  `support_email`             varchar(255)                                      DEFAULT NULL,
  `support_address`           text                                              NOT NULL,
  `managed`                   int(1)                                            NOT NULL DEFAULT '0',
  `download_url`              varchar(255)                                      NOT NULL DEFAULT '',
  `device_limit`              int(11)                                           NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_files
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_files`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_files` (
  `id`                        int(11)      NOT NULL AUTO_INCREMENT,
  `name`                      varchar(255) NOT NULL DEFAULT '',
  `source`                    varchar(255) NOT NULL DEFAULT '',
  `comment`                   text         DEFAULT NULL,
  `entities_id`               int(11) NOT  NULL DEFAULT '0',
  `version`                   int(11) NOT  NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_fleets
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_fleets`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_fleets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `entities_id` int(11) NOT NULL DEFAULT '0',
  `is_recursive` int(1) NOT NULL DEFAULT '0',
  `is_default` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_geolocations
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_geolocations`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_geolocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computers_id` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(255) NOT NULL DEFAULT '',
  `longitude` varchar(255) NOT NULL DEFAULT '',
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computers_id` (`computers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_mqttacls
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_mqttacls`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_mqttacls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_flyvemdm_mqttusers_id` int(11) NOT NULL DEFAULT '0',
  `topic` varchar(255) NOT NULL DEFAULT '',
  `access_level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`plugin_flyvemdm_mqttusers_id`,`topic`),
  KEY `plugin_flyvemdm_mqttusers_id` (`plugin_flyvemdm_mqttusers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_mqttlogs
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_mqttlogs`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_mqttlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `direction` varchar(1) NOT NULL DEFAULT '' COMMENT 'I for received message, O for sent message',
  `topic` varchar(255) NOT NULL DEFAULT '',
  `message` mediumtext DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `items_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `itemtype` (`itemtype`),
  KEY `items_id` (`items_id`),
  KEY `date` (`date`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Received MQTT messages log';


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_mqttusers
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_mqttusers`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_mqttusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicity` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_packages
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_packages`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_packages` (
  `id`                    int(11)                              NOT NULL AUTO_INCREMENT,
  `name`                  varchar(255)                         NOT NULL DEFAULT '',
  `package_name`          varchar(255)                         NOT NULL DEFAULT '',
  `alias`                 varchar(255)                         NOT NULL DEFAULT '',
  `version`               varchar(255)                         NOT NULL DEFAULT '',
  `version_code`          varchar(255)                         NOT NULL DEFAULT '',
  `icon`                  text                                 NOT NULL,
  `filename`              varchar(255)                         NOT NULL DEFAULT '',
  `entities_id`           int(11)                              NOT NULL DEFAULT '0',
  `dl_filename`           varchar(255)                         NOT NULL DEFAULT '',
  `parse_status`          enum('pending', 'parsed', 'failed')  NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `entities_id` (`entities_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_wellknownpaths
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_wellknownpaths`;
CREATE TABLE IF NOT EXISTS `glpi_plugin_flyvemdm_wellknownpaths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `glpi_plugin_flyvemdm_wellknownpaths` VALUES (1, '%SDCARD%',      '', 1);
INSERT INTO `glpi_plugin_flyvemdm_wellknownpaths` VALUES (2, '%DOCUMENTS%',   '', 0);
INSERT INTO `glpi_plugin_flyvemdm_wellknownpaths` VALUES (3, '%PHOTOS%',      '', 0);
INSERT INTO `glpi_plugin_flyvemdm_wellknownpaths` VALUES (4, '%MUSIC%',       '', 0);


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_policycategories
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_policycategories`;
CREATE TABLE `glpi_plugin_flyvemdm_policycategories` (
  `id`                                         int(11)        NOT NULL    AUTO_INCREMENT,
  `name`                                       varchar(255)   NOT NULL    DEFAULT '',
  `plugin_flyvemdm_policycategories_id`        int(11)        NOT NULL    DEFAULT '0',
  `completename`                               text           DEFAULT NULL,
  `comment`                                    text           DEFAULT NULL,
  `level`                                      int(11)        NOT NULL    DEFAULT '0',
  `sons_cache`                                 longtext       DEFAULT NULL,
  `ancestors_cache`                            longtext       DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unicity` (`plugin_flyvemdm_policycategories_id`, `name`),
  KEY `plugin_flyvemdm_policycategories_id` (`plugin_flyvemdm_policycategories_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_policies
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_policies`;
CREATE TABLE `glpi_plugin_flyvemdm_policies` (
  `id`                                         int(11)        NOT NULL AUTO_INCREMENT,
  `name`                                       varchar(255)   NOT NULL DEFAULT '',
  `group`                                      varchar(255)   NOT NULL DEFAULT '',
  `symbol`                                     varchar(255)   NOT NULL DEFAULT '',
  `type`                                       varchar(255)   NOT NULL DEFAULT '',
  `type_data`                                  text           DEFAULT NULL,
  `unicity`                                    tinyint(1)     NOT NULL DEFAULT '1',
  `plugin_flyvemdm_policycategories_id`        int(11)        NOT NULL DEFAULT '0',
  `comment`                                    text           DEFAULT NULL,
  `default_value`                              varchar(255)   NOT NULL DEFAULT '',
  `recommended_value`                          varchar(255)   NOT NULL DEFAULT '',
  `is_android_system`                          tinyint(1)     NOT NULL DEFAULT '0',
  `android_min_version`                        varchar(255)   NOT NULL DEFAULT '0',
  `android_max_version`                        varchar(255)   NOT NULL DEFAULT '0',
  `apple_min_version`                          varchar(255)   NOT NULL DEFAULT '0',
  `apple_max_version`                          varchar(255)   NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `plugin_flyvemdm_policycategories_id` (`plugin_flyvemdm_policycategories_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_tasks
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_tasks`;
CREATE TABLE `glpi_plugin_flyvemdm_tasks` (
  `id`                                         int(11)      NOT NULL AUTO_INCREMENT,
  `itemtype_applied`                           varchar(255) DEFAULT NULL,
  `items_id_applied`                           int(11)      NOT NULL DEFAULT '0',
  `plugin_flyvemdm_policies_id`                int(11)      NOT NULL DEFAULT '0',
  `value`                                      varchar(255) NOT NULL DEFAULT '',
  `itemtype`                                   varchar(255) DEFAULT NULL,
  `items_id`                                   int(11)      NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_applied` (`items_id_applied`, `itemtype_applied`),
  KEY `plugin_flyvemdm_policies_id` (`plugin_flyvemdm_policies_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_invitations
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_invitations`;
CREATE TABLE `glpi_plugin_flyvemdm_invitations` (
  `id`                               int(11)                   NOT NULL AUTO_INCREMENT,
  `name`                             varchar(255)              NOT NULL DEFAULT '',
  `invitation_token`                 varchar(255)              NOT NULL DEFAULT '',
  `users_id`                         int(11)                   NOT NULL DEFAULT '0',
  `entities_id`                      int(11)                   NOT NULL DEFAULT '0',
  `documents_id`                     int(11)                   NOT NULL DEFAULT '0',
  `status`                           enum('pending','done')    NOT NULL DEFAULT 'pending',
  `expiration_date`                  datetime                  NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `entities_id` (`entities_id`),
  KEY `documents_id` (`documents_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_invitationlogs
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_invitationlogs`;
CREATE TABLE `glpi_plugin_flyvemdm_invitationlogs` (
  `id`                               int(11)                   NOT NULL AUTO_INCREMENT,
  `plugin_flyvemdm_invitations_id`   int(11)                   NOT NULL DEFAULT '0',
  `date_creation`                    datetime                  NOT NULL DEFAULT '0000-00-00 00:00:00',
  `event`                            varchar(255)              NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `plugin_flyvemdm_invitations_id` (`plugin_flyvemdm_invitations_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- Export de la structure de table glpi-flyvemdm. glpi_plugin_flyvemdm_taskstatuses
DROP TABLE IF EXISTS `glpi_plugin_flyvemdm_taskstatuses`;
CREATE TABLE `glpi_plugin_flyvemdm_taskstatuses` (
  `id`                                  int(11) NOT NULL AUTO_INCREMENT,
  `name`                                varchar(255) NOT NULL DEFAULT '',
  `date_creation`                       datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_mod`                            datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `plugin_flyvemdm_agents_id`           int(11) NOT NULL DEFAULT '0',
  `plugin_flyvemdm_tasks_id`            int(11) NOT NULL DEFAULT '0',
  `status`                              varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `plugin_flyvemdm_agents_id` (`plugin_flyvemdm_agents_id`),
  INDEX `plugin_flyvemdm_tasks_id` (`plugin_flyvemdm_tasks_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
