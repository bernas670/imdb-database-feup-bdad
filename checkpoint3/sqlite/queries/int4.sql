.mode columns
.headers on
.nullvalue NULL

SELECT Country.name, max(cnt) as firstPremieres
FROM (SELECT countryID,count(*) as cnt
      FROM (SELECT Released.contentID, Released.countryID, min(Released.date) as Mininum
            FROM Released
            GROUP BY Released.contentID) as EarliestReleasePerContent
      GROUP BY countryID) as FirstPremierePerCountry
    , Country
WHERE Country.id = FirstPremierePerCountry.countryID;