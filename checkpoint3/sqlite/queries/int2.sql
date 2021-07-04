.mode columns
.headers on
.nullvalue NULL

SELECT Person.id, firstName, lastName
FROM Person, RolePersonContent, Role ON personID = Person.id AND roleID = Role.id
WHERE Role.description = 'Actor' AND contentID IN 
(
    SELECT contentID
    FROM RolePersonContent, Person, Role 
    ON personID = Person.id AND roleID = Role.id
    WHERE Person.firstName = 'Stanley' AND 
          Person.lastName = 'Kubrick' AND 
          role.description = 'Director'
); 
