.mode columns
.headers on
.nullvalue NULL

WITH W as (SELECT * 
            FROM (SELECT * 
                  FROM Watchlist JOIN User ON (Watchlist.userID = User.id) )as WatchlistWithUsernames 
                                 JOIN RolePersonContent ON (WatchlistWithUsernames.contentID = RolePersonContent.contentID ))
SELECT W1.name as user1, W2.name as user2
FROM (W as W1 JOIN W as W2 ON (W1.userID < W2.userID and W1.personID = W2.personID))
GROUP BY user1,user