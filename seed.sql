DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS developers;

CREATE TABLE developers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  founded DATE,
  country VARCHAR(50)
);

CREATE TABLE games(
  id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  released DATE,
  genre VARCHAR(50),
  developer_id int REFERENCES developers(id)
);

INSERT INTO developers(name,founded,country) VALUES('Valve','1996-08-24','America');
INSERT INTO developers(name,founded,country) VALUES('Stoic Studio','2012-01-01','America');
INSERT INTO developers(name,founded,country) VALUES('Capcom','1983-06-11','Japan');
INSERT INTO developers(name,founded,country) VALUES('Konami','1969-03-21','Japan');

INSERT INTO games (title,released,genre,developer_id) VALUES('Counter-Strike: Global Offensive','2012-08-21','first-person shooter',1);
INSERT INTO games (title,released,genre,developer_id) VALUES('Half-life: Source','2004-06-01','first-person shooter',1);
INSERT INTO games (title,released,genre,developer_id) VALUES('The Banner Saga','2014-02-14','Role Playing Game',2);
INSERT INTO games (title,released,genre,developer_id) VALUES('Devil May Cry','2001-08-23','Action Adventure',3);
INSERT INTO games (title,released,genre,developer_id) VALUES('Street Fighter V','2016-02-01','Fighter',3);
INSERT INTO games (title,released,genre,developer_id) VALUES('Silent Hill','1999-01-31','Survival Horror',4);
