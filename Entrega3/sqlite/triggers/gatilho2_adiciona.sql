CREATE TRIGGER UpsHesDead
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
    SELECT raise(rollback, 'LOL, USARAM O CADAVER COMO FIGURANTE? SO PODE');
END;
