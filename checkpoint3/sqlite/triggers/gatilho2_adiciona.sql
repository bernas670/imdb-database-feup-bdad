.mode columns
.headers on
.nullvalue NULL

CREATE TRIGGER ImpossibleAppearance
BEFORE INSERT ON RolePersonContent
FOR EACH ROW

WHEN (
        SELECT DISTINCT dateOfDeath
        FROM Person
        WHERE Person.id = New.personID
     )
      <
     (
        SELECT DISTINCT min(Released.date) AS dateOfDebut
        FROM Content, Released ON Content.id = Released.contentID
        WHERE Content.id = New.contentID
     )
BEGIN
    SELECT raise(rollback, 'That person could not have appeared in that movie.');
END;
