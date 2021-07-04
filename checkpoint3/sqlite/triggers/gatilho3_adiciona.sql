CREATE TRIGGER RemoveFromWatchlist
AFTER INSERT ON ContentReview
FOR EACH ROW
WHEN New.contentID IN (SELECT contentID
                       FROM Watchlist
                       WHERE userID = New.userID)
BEGIN
    DELETE FROM Watchlist WHERE userID = New.userID AND contentID = New.contentID;
END;