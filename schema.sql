CREATE DATABASE yeti
  DEFAULT CHAR SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE yeti;

CREATE TABLE kategory
(
  id          INT AUTO_INCREMENT PRIMARY KEY,
  name        CHAR UNIQUE,
  symbol_code CHAR UNIQUE
);

CREATE TABLE lot
(
  id            INT AUTO_INCREMENT PRIMARY KEY,
  creation_date DATETIME,
  name          CHAR NOT NULL,
  description   CHAR NOT NULL,
  img_source    CHAR,
  price         REAL,
  end_date      DATETIME,
  bid_step      INT
);

CREATE INDEX creation_date ON lot (creation_date);
CREATE INDEX end_date ON lot (end_date);

CREATE TABLE bid
(
  id    INT AUTO_INCREMENT PRIMARY KEY,
  date  DATETIME,
  price REAL
);

CREATE TABLE user
(
  id                INT AUTO_INCREMENT PRIMARY KEY,
  registration_date DATETIME,
  email             CHAR,
  name              CHAR,
  password          CHAR,
  contacts          CHAR
);
