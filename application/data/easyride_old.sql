CREATE SCHEMA IF NOT EXISTS easyride_db DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE easyride_db;

-- Таблица автомобилей
CREATE TABLE er_car(
regnumber VARCHAR(20) NOT NULL,
userid VARCHAR(100) NOT NULL,
brand VARCHAR(50),
model VARCHAR(50),
color VARCHAR(100),
seats INT UNSIGNED NOT NULL,
photo VARCHAR(255),
fuelrate DECIMAL UNSIGNED,
PRIMARY KEY(regnumber)
);

-- Таблица прав доступа
CREATE TABLE IF NOT EXISTS er_access (
  id CHAR(2) NOT NULL,
  descr VARCHAR(255) NOT NULL,
  INDEX (id ASC)
);

-- Таблица статуса пользователей
CREATE TABLE er_userstatus(
  id CHAR(2) NOT NULL,
  descr VARCHAR(255) NOT NULL,
  INDEX (id ASC)
);

-- Таблица пользователей
CREATE TABLE er_user(
email VARCHAR(100) NOT NULL,
userpassword VARCHAR(100) NOT NULL,
username VARCHAR(100),
surname VARCHAR(100),
phone VARCHAR(200),
birthday DATE,
gendor CHAR(1),
rate INT UNSIGNED,
photo VARCHAR(255),
crdate DATETIME NOT NULL,
access VARCHAR(100) NOT NULL,
userstatus VARCHAR(10) NOT NULL,
PRIMARY KEY(email),
UNIQUE INDEX(phone),
CONSTRAINT access_key
    FOREIGN KEY (access)
    REFERENCES er_access (id),
CONSTRAINT status_key
  FOREIGN KEY (userstatus)
  REFERENCES er_userstatus (id)
);

-- Таблица маршрутов
CREATE TABLE IF NOT EXISTS er_roadrout (
  id VARCHAR(15) NOT NULL,
  driverid VARCHAR(100) NOT NULL,
  start VARCHAR(255) NOT NULL,
  start_adress VARCHAR(255),
  finish VARCHAR(255) NOT NULL,
  finish_adress VARCHAR(255),
  terms TEXT,
  autoid VARCHAR(20) NOT NULL,
  freeseats INT UNSIGNED,
  price DECIMAL UNSIGNED,
  startdate DATETIME,
  timetrip TIME,
  status VARCHAR(10) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT driverid_key
    FOREIGN KEY (driverid)
    REFERENCES er_user (email),
  CONSTRAINT car_key
    FOREIGN KEY (autoid)
    REFERENCES er_car (regnumber)
);

-- Таблица пассажиров
CREATE TABLE IF NOT EXISTS er_passenger (
  roadroutid VARCHAR(15) NOT NULL,
  userid VARCHAR(100) NOT NULL,
  UNIQUE INDEX (userid ASC),
  CONSTRAINT rout_pass_key
    FOREIGN KEY (roadroutid)
    REFERENCES er_roadrout (id),
  CONSTRAINT user_key
    FOREIGN KEY (userid)
    REFERENCES er_user (email)
);

-- Таблица промежуточных пунктов следования
CREATE TABLE IF NOT EXISTS er_routpoint (
  roadroutid VARCHAR(15) NOT NULL,
  point VARCHAR(255) NOT NULL,
  pointqueue INT NOT NULL,
  INDEX (roadroutid ASC),
  CONSTRAINT rout_key
    FOREIGN KEY (roadroutid)
    REFERENCES er_roadrout (id)
);

-- Заполнение таблиц данными
START TRANSACTION;

INSERT INTO er_access(id, descr) VALUES ('am','администратор');
INSERT INTO er_access(id, descr) VALUES ('dr','водитель');
INSERT INTO er_access(id, descr) VALUES ('ps','пассажир');

INSERT INTO er_userstatus(id, descr) VALUES ('1','approved');
INSERT INTO er_userstatus(id, descr) VALUES ('2','verification');
INSERT INTO er_userstatus(id, descr) VALUES ('3','not approved');
INSERT INTO er_userstatus(id, descr) VALUES ('4','deprecated');

INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('ivan@i.ua','698d51a19d8a121ce581499d7b701668','Иван','Петров','+380562334458','1981-02-11','m','1','http://placehold.it/150x150','2015-02-01 13:10:01','ps','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('kola@i.ua','698d51a19d8a121ce581499d7b701668','Николай','Басков','+380562445566','1971-07-18','m','10','http://placehold.it/150x150','2015-01-01 00:00:05','dr','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('john@i.ua','698d51a19d8a121ce581499d7b701668','Джон','Траволта','+380562556677','1985-10-07','m','15','http://placehold.it/150x150','2015-03-20 21:32:05','dr','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('alex@i.ua','698d51a19d8a121ce581499d7b701668','Алексей','Гагарин','+380562667788','1964-06-21','m','20','http://placehold.it/150x150','2015-02-23 16:34:17','dr','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('givi@i.ua','698d51a19d8a121ce581499d7b701668','Гиви','Бендукидзе','+380562778899','1978-02-13','m','30','http://placehold.it/150x150','2015-02-03 15:32:12','am','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('den@i.ua','698d51a19d8a121ce581499d7b701668','Денис','Простой','+380562889911','1989-11-12','m','18','http://placehold.it/150x150','2015-01-23 21:34:06','ps','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('mark@i.ua','698d51a19d8a121ce581499d7b701668','Марк','Твен','+380562991122','1991-05-11','m','32','http://placehold.it/150x150','2015-02-07 14:07:18','dr','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('elena@i.ua','698d51a19d8a121ce581499d7b701668','Елена','Сотник','+380562112233','1982-12-26','w','1','http://placehold.it/150x150','2015-03-30 20:33:10','ps','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('olga@i.ua','698d51a19d8a121ce581499d7b701668','Ольга','Денисова','+380562223344','1979-03-02','w','1','http://placehold.it/150x150','2015-03-29 18:32:12','ps','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('piter@i.ua','698d51a19d8a121ce581499d7b701668','Петр','Мазепа','+380562334455','1992-09-13','m','1','http://placehold.it/150x150','2015-02-21 15:48:02','dr','1');
INSERT INTO er_user(email, userpassword, username, surname, phone, birthday, gendor, rate, photo, crdate, access, userstatus)
    VALUES ('georg@i.ua','698d51a19d8a121ce581499d7b701668','Григорий','Лепс','+380562441122','1987-06-03','m','1','http://placehold.it/150x150','2015-03-17 22:18:18','ps','1');

INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE5488AD','kola@i.ua','reno','megane','black',2, 'http://placehold.it/350x150', 8);
INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE5487EE','john@i.ua','mersedes','600','blue',1, 'http://placehold.it/350x150', 12);
INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE6488II','alex@i.ua','opel','kadet','red',4, 'http://placehold.it/350x150', 6);
INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE1418AK','mark@i.ua','zaz','tavriya','gray',1, 'http://placehold.it/350x150', 5);
INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE6318KL','piter@i.ua','BMW','x5','black',4, 'http://placehold.it/350x150', 13);
INSERT INTO er_car(regnumber, userid, brand, model, color, seats, photo, fuelrate) VALUES ('AE6318KK','piter@i.ua','Porshe','Cayenne','black',4, 'http://placehold.it/350x150', 17);

INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150101','kola@i.ua','Москва','Красная площадь','Киев','Крещатик','в салоне не курят','AE5488AD','2','800','2015-02-11 04:00:00','12:00:00','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150320','john@i.ua','Chikago','Street 1','Dallas','Avenue 4','no smoking, no pets','AE5487EE','1','1200','2015-05-10 13:00:00','','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
VALUES ('20150321','alex@i.ua','Chikago','Street 2','Dallas','Avenue 2','no smoking, no pets','AE6488II','2','1100','2015-06-03 18:00:00','','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150223','alex@i.ua','Кривой рог','Пр. Мира 1','Львов','Вул. Степана Бандери 5','в салоне не курят, без животных','AE6488II','3','450','2015-03-02 07:00:00','10:00:00','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150207','mark@i.ua','Кременчуг','Ул. Красина 5','Днепропетровск','Ул. Шмидта 14','без детей, без животных','AE1418AK','4','180','2015-02-13 07:00:00','2:00:00','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150221','piter@i.ua','Полтава','Вул. Полтавський шлях','Санкт-Петербург','Ул. Феодосийская 8','','AE6318KL','0','900','2015-05-28 03:00:00','16:00:00','closed');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
    VALUES ('20150717','piter@i.ua','Санкт-Петербург','Ул. Феодосийская 8','Полтава','Вул. Полтавський шлях','','AE6318KK','2','900','2015-07-17 03:00:00','16:00:00','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
VALUES ('20150718','piter@i.ua','Chikago','Street 3','Dallas','Avenue 3','','AE6318KK','3','1750','2015-12-21 08:00:00','6:00:00','opened');
INSERT INTO er_roadrout(id, driverid, `start`,`start_adress`, finish, finish_adress, terms, autoid, freeseats, price, startdate, timetrip, `status`)
VALUES ('20150720','mark@i.ua','Chikago','Street 8','Dallas','Avenue 20','no smoking','AE1418AK','1','1250','2015-12-22 15:00:00','','opened');

INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150101','ivan@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150320','den@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150320','elena@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150221','olga@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150221','georg@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150717','kola@i.ua');
INSERT INTO er_passenger(roadroutid, userid) VALUES ('20150717','john@i.ua');

INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150101','Минск','1');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150221','Москва','1');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150221','Воронеж','2');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150221','Харьков','3');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150717','Москва','3');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150717','Воронеж','2');
INSERT INTO er_routpoint(roadroutid, point, pointqueue) VALUES ('20150717','Харьков','1');

COMMIT;
