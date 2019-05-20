.mode columns
.headers on
.nullvalue NULL

SELECT id, firstName, lastName
FROM Person, RolePersonContent ON personID = person.id
WHERE roleID = 1 AND contentID IN (
                                    SELECT contentID
                                    FROM RolePersonContent, Person ON personID = person.id
                                    WHERE personID = 14 AND roleID = 2
                                  ); 
