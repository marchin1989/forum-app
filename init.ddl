-- データベースの作成
CREATE DATABASE forum;

-- テーブルの作成
CREATE TABLE IF NOT EXISTS `forum`.`posts`(
  `id` CHAR(36) NOT NULL,
  `message` VARCHAR(255) NOT NULL,
  `created_at` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`)
);

-- サンプルデータ追加
INSERT INTO `forum`.`posts` (`id`, `message`, `created_at`)VALUES
(1, 'hogehoge', now()),
(2, 'fugafuga', now());

-- ユーザーを作成し、権限を与える
CREATE USER 'mysql'@'localhost' IDENTIFIED BY 'password';
GRANT all ON *.* TO 'mysql'@'localhost';
