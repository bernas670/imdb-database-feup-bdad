.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

print('Inserting content 20 in user 1 watchlist');
INSERT INTO Watchlist VALUES (20, 1);
SELECT * FROM Watchlist;
SELECT 'Inserting review of user 1 to content 20';
INSERT INTO ContentReview VALUES (20, 1, 10, 'liked it');
SELECT * FROM Watchlist; 
SELECT 'Content 20 was removed from watchlist';