
PRAGMA foreign_keys = ON;

SELECT ('Inserting person that passed in 1999-03-07');
INSERT INTO Person VALUES(50,'Test','Person','Test Person was a nice guy.',NULL,'1928-07-26','1999-03-07',1,2);
INSERT INTO Content VALUES(50,'TestMovie', 'TestDesc', 'M/0', NULL, 200);
INSERT INTO Released VALUES(50, '2010-12-12', 1);
INSERT INTO Released VALUES(50, '2011-09-09', 8);
INSERT INTO Released VALUES(50, '1999-03-06', 2);
SELECT ('Inserting release that of movie in 1999-03-06');
INSERT INTO Movie VALUES(50, 2000, 12342134, 123412432134);
SELECT ('Inserting role of that person in that movie');
INSERT INTO RolePersonContent VALUES(1,50,50);
