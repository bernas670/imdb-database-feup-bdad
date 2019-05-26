.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

SELECT contentID, score
FROM ContentReview
WHERE contentID = 1;

SELECT id, score
FROM Content
WHERE id = 1;

INSERT INTO ContentReview VALUES(1,4,10, 'Very very very nice.');
INSERT INTO ContentReview VALUES(1,5,8, 'Very nice.');
INSERT INTO ContentReview VALUES(1,6,9, 'Very very nice.');

SELECT contentID, score
FROM ContentReview
WHERE contentID = 1;

SELECT id, score
FROM Content
WHERE id = 1;
