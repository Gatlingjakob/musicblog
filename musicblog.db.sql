BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `user` (
	`id`	INTEGER NOT NULL,
	`username`	VARCHAR ( 50 ) UNIQUE,
	`password`	VARCHAR ( 50 ),
	PRIMARY KEY(`id`)
);
INSERT INTO `user` VALUES (1,'Gatlingjakob','pbkdf2:sha256:150000$irw75IYn$630be41ba3321f2a77ff07a0ff4a43c5aa90604c61ebfece351ff3a91f18911a');
CREATE TABLE IF NOT EXISTS `review` (
	`id`	INTEGER NOT NULL,
	`title`	VARCHAR ( 200 ),
	`subtitle`	VARCHAR ( 50 ),
	`author`	VARCHAR ( 50 ),
	`date_posted`	DATETIME,
	`content`	TEXT,
	`score`	VARCHAR ( 50 ),
	`artist`	VARCHAR ( 200 ),
	`release_title`	VARCHAR ( 200 ),
	`art_filename`	VARCHAR ( 500 ),
	`is_published`	INTEGER,
	`genres`	VARCHAR ( 500 ),
	`updated_at`	DATETIME,
	PRIMARY KEY(`id`)
);
INSERT INTO `review` VALUES (1,'jakob - mit album','asd','Jakob','2020-04-11 21:29:28.297454','updated','8',NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO `review` VALUES (2,'jakob - mit album2','good album','Jakob','2020-04-11 23:54:09.354571','updated','5',NULL,NULL,NULL,1,NULL,NULL);
INSERT INTO `review` VALUES (3,'Noname - Telefone','Favourite album of the decade','Jakob','2020-04-12 01:03:45.322799','My fave!','10',NULL,NULL,'noname-telefone.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (4,'sun - music','good','Jakob','2020-04-12 02:01:15.019992','asdasd','4','sun','music','noname-telefone.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (5,'horrendou - sssd','as','as','2020-04-12 02:01:51.823323','222','3','horrendou','sssd','horrendous-album.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (6,'crazy frog - crazy hits ','Best album in a while honestly','Jakob','2020-04-12 02:09:33.391670','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','9','crazy frog','crazy hits ','crazyfrog-album.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (7,'jeke - da','da','dada','2020-04-12 14:59:58.161657','adsasdasdad','8','jeke','da','crazyfrog-album.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (8,'Caroline Polachek - Pang','awesome pop','Jakob','2020-04-12 15:30:29.296677','Really good pop album - awesome production','8','Caroline Polachek','Pang','caroline-polachek-pang.jpg',1,NULL,NULL);
INSERT INTO `review` VALUES (9,'Denzel Curry and Kenny Beats - Unlocked','Really awesome Hiphop EP','Jakob','2020-04-13 01:35:13.688684','Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.','8','Denzel Curry and Kenny Beats','Unlocked','unlocked-kenny-denzel.jpg',1,NULL,NULL);
INSERT INTO `review` VALUES (10,'Beach House - Bloom','Beautiful Indie Pop Album from an dynamic duo','Jakob','2020-04-13 12:40:29.549000','I discovered this album one day when I has hungover on my couch (which was all I did that entire day).
I couldn''t move my body an inch due to the intoxication of yesterday, but this album sure did move me... In the brain - that is to say, right in the feelorinos. This album is just gorgeous and beautiful. This is a must-listen for anyone remotely interested in contemporary pop and/or rock and anyone who has a  brain and/or a heart!','9','Beach House','Bloom','beachhouse-bloom.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (11,'horrendous - den nye','as','Jakob','2020-04-13 22:20:25.575157','jajajajajaj!','7','horrendous','den nye','horrendous-album_1.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (12,' - ','','','2020-04-14 03:12:13.473887','','','','','parchment.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (13,'the blue jeans - blueprint','fake album','Jakob','2020-04-15 12:40:03.468126','suuuuuper fake','6','the blue jeans','blueprint','blueprint_1.jpeg',1,NULL,NULL);
INSERT INTO `review` VALUES (14,'Caroline Polachek - Pang','Very good','Jakob','2020-04-22 16:40:31.964687','A good pop album','8','Caroline Polachek','Pang','caroline-polachek-pang_2.jpg',1,NULL,NULL);
INSERT INTO `review` VALUES (15,'brockmadness - stan','toppen','jakob','2020-05-01 20:11:16.504670','updated','9','brockmadness','stan','brockh.jpg',0,NULL,NULL);
INSERT INTO `review` VALUES (16,'Beach House - Bloom','One of the best albums of the decade','Jakob','2020-05-03 15:45:53.989476','Perfect album','10','Beach House','Bloom','beachhouse-bloom_2.jpeg',1,'Indie, Dream pop',NULL);
INSERT INTO `review` VALUES (17,'jeke - jejeke','jeke','jeke','2020-05-06 15:29:54.206906','asdasd','5','jeke','jejeke','crazyfrog-album_10.jpeg',1,'jeke,jeke,jeke',NULL);
CREATE TABLE IF NOT EXISTS `blogpost` (
	`id`	INTEGER NOT NULL,
	`title`	VARCHAR ( 200 ),
	`subtitle`	VARCHAR ( 200 ),
	`author`	VARCHAR ( 50 ),
	`date_posted`	DATETIME,
	`content`	TEXT,
	`is_published`	INTEGER,
	`updated_at`	DATETIME,
	PRIMARY KEY(`id`)
);
INSERT INTO `blogpost` VALUES (1,'det er fedt!','MEGET','jakob','2020-04-11 21:31:32.300547','hej hej hej 
<h1> DET ER VILDT </h1>',1,NULL);
INSERT INTO `blogpost` VALUES (2,'new','new','jakob','2020-04-12 14:58:40.371710','yeayeah',1,NULL);
INSERT INTO `blogpost` VALUES (3,'This day was excellent','Got to watch a movie with my bub','Jakob','2020-04-13 01:31:13.787472','So, I watched one of my favourite movies today...
WITH MY BUB!

The movie was Hannibal 2001.

I rate it 8/10. It is supsenseful and stuff.',1,NULL);
INSERT INTO `blogpost` VALUES (4,'123','123','123','2020-04-13 21:20:53.827105','123',1,NULL);
INSERT INTO `blogpost` VALUES (5,'ja','ja','ja','2020-05-01 20:18:36.083125','ja',1,NULL);
INSERT INTO `blogpost` VALUES (6,'a','a','a','2020-05-03 15:21:08.257908','a',1,NULL);
INSERT INTO `blogpost` VALUES (7,'a','a','a','2020-05-03 15:21:21.071950','a',1,NULL);
INSERT INTO `blogpost` VALUES (8,'a','a','a','2020-05-03 15:21:23.627747','a',1,NULL);
INSERT INTO `blogpost` VALUES (9,'a','a','a','2020-05-03 15:21:25.811191','a',1,NULL);
INSERT INTO `blogpost` VALUES (10,'a','a','a','2020-05-03 15:21:27.871515','a',1,NULL);
INSERT INTO `blogpost` VALUES (11,'a','a','a','2020-05-03 15:21:29.854836','a',1,NULL);
INSERT INTO `blogpost` VALUES (12,'this','is','greate','2020-05-03 15:32:11.091709','jasdads',1,NULL);
INSERT INTO `blogpost` VALUES (13,'Motorcross','og det er pissefedt','Daniel','2020-07-08 18:04:07.807563','iaosdhaoisdhoiashdioa
iaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioa

iaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioa
iaosdhaoisdhoiashdioaiaosdhaoisdhoiashdioa
',1,NULL);
CREATE TABLE IF NOT EXISTS `alembic_version` (
	`version_num`	VARCHAR ( 32 ) NOT NULL,
	CONSTRAINT `alembic_version_pkc` PRIMARY KEY(`version_num`)
);
INSERT INTO `alembic_version` VALUES ('ba2084a033ed');
COMMIT;
