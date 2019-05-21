CREATE TRIGGER UpdateContentScore
AFTER INSERT ON ContentReview
FOR EACH ROW
BEGIN

    UPDATE Content
    SET score = (
                    SELECT avg(score) 
                    FROM
                    (
                        SELECT id, score
                        FROM ContentReview
                        WHERE ContentReview.contentID = New.contentID 
                    )
                )
    WHERE Content.id = New.contentID;

END;

CREATE TRIGGER UpdateTvShowScore
AFTER INSERT ON TVShowReview
FOR EACH ROW
BEGIN

    UPDATE TVShow
    SET score = (
                    SELECT avg(score)
                    FROM
                    (
                        SELECT id, score
                        FROM TVShowReview
                        WHERE TVShowReview.tvshowID = New.tvshowID 
                    )
                )
    WHERE TVShow.id = New.tvshowID;

END;