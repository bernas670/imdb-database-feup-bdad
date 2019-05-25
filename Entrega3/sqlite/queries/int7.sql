
WITH W as (SELECT * FROM Watchlist JOIN RolePersonContent ON (Watchlist.contentID = RolePersonContent.contentID ))
SELECT W1.userID as user1, W2.userID as user2
FROM W as W1 JOIN W as W2 ON (W1.userID < W2.userID and W1.personID = W2.personID)
GROUP BY user1,user2

SELECT W1.userID as user1, W2.userID as user2
FROM
    (SELECT *
    FROM Watchlist JOIN RolePersonContent ON (Watchlist.contentID = RolePersonContent.contentID )) as W1,
    (SELECT *
    FROM Watchlist JOIN RolePersonContent ON (Watchlist.contentID = RolePersonContent.contentID )) as W2
WHERE W1.userID < W2.userID and W1.personID = W2.personID
GROUP BY user1,user2