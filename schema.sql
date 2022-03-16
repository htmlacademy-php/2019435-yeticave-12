CREATE DATABASE yeti
  DEFAULT CHAR SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeti;

CREATE TABLE category
(
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        CHAR(10) NOT NULL,
  symbol_code CHAR(10) UNIQUE NOT NULL
);

CREATE TABLE lot
(
  id            INT AUTO_INCREMENT PRIMARY KEY,
  creation_date DATETIME NOT NULL ,
  name          CHAR(10) NOT NULL,
  description   TEXT NOT NULL,
  img_source    CHAR(20) NOT NULL,
  price         REAL NOT NULL,
  end_date      CHAR(10) NOT NULL,
  bid_step      INT NOT NULL,
  author        CHAR(10) NOT NULL,
  winner        CHAR(10) NULL,
  category      CHAR(10) NOT NULL
);

CREATE INDEX creation_date ON lot (creation_date);
CREATE INDEX end_date ON lot (end_date);

CREATE TABLE bid
(
  id    INT AUTO_INCREMENT PRIMARY KEY,
  date  DATETIME NOT NULL,
  price REAL NOT NULL,
  user  CHAR(10) NOT NULL,
  lot   CHAR(10) NOT NULL
);

CREATE TABLE user
(
  id                INT AUTO_INCREMENT PRIMARY KEY,
  registration_date DATETIME NOT NULL,
  email             CHAR(15) NOT NULL,
  name              CHAR(10) NOT NULL,
  password          CHAR(40) NOT NULL,
  contacts          TEXT NOT NULL,
  created_lots      TEXT NULL,
  created_bids      TEXT NULL
);
