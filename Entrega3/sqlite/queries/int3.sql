.mode columns
.headers on
.nullvalue NULL


SELECT Content.name as MovieName, ActorParticipationCount.PersonFN, ActorParticipationCount.PersonLN, max(cnt) as participationNumber
FROM Content, (SELECT Movie.id AS MovieID,Person.id AS PersonID, Person.firstName AS PersonFN, Person.lastName AS PersonLN, count(Person.id) as cnt
                FROM  Person,Movie,(SELECT * 
                                    FROM RolePersonContent JOIN Role ON (RolePersonContent.roleID = Role.id) 
                                    WHERE Role.description = 'Actor') AS ActorContent
                WHERE Person.id = ActorContent.personID and Movie.id = ActorContent.contentID 
                GROUP BY Person.id)    AS ActorParticipationCount   
WHERE Content.id = ActorParticipationCount.MovieID
GROUP BY ActorParticipationCount.MovieID; 