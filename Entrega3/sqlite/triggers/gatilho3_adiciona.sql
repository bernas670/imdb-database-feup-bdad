CREATE TRIGGER DidNotParticipate
BEFORE INSERT ON MovieAward
FOR EACH ROW
WHEN New.personID NOT IN (
                            SELECT personID
                            FROM RolePersonContent
                            WHERE contentID = New.movieID
                         )
BEGIN
    SELECT raise(rollback, 'That person did not participate in that movie.');
END;