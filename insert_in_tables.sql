INSERT INTO imdb.name_basics
SELECT
    nconst,
    NULLIF(primaryName, '\\N') AS primaryName,
    multiIf((birthYear = '\\N') OR (birthYear = ''), NULL, toUInt16OrNull(birthYear)) AS birthYear,
    multiIf((deathYear = '\\N') OR (deathYear = ''), NULL, toUInt16OrNull(deathYear)) AS deathYear,
    NULLIF(primaryProfession, '\\N') AS primaryProfession,
    NULLIF(knownForTitles, '\\N') AS knownForTitles
FROM file(
    '/var/lib/clickhouse/user_files/name.basics.tsv',
    'TabSeparatedWithNames',
    'nconst String, primaryName String, birthYear String, deathYear String, primaryProfession String, knownForTitles String'
);

INSERT INTO imdb.title_basics SELECT
    tconst,
    titleType,
    primaryTitle,
    originalTitle,
    toUInt8(isAdult) AS isAdult,
    multiIf((startYear = '\\N') OR (startYear = ''), NULL, toUInt16(startYear)) AS startYear,
    multiIf((endYear = '\\N') OR (endYear = ''), NULL, toUInt16(endYear)) AS endYear,
    multiIf((runtimeMinutes = '\\N') OR (runtimeMinutes = ''), NULL, toUInt32(runtimeMinutes)) AS runtimeMinutes,
    NULLIF(genres, '\\N') AS genres
FROM file(
    '/var/lib/clickhouse/user_files/title.basics.tsv',
    'TabSeparatedWithNames',
    'tconst String, titleType String, primaryTitle String, originalTitle String, isAdult String, startYear String, endYear String, runtimeMinutes String, genres String')
;

INSERT INTO imdb.title_akas SELECT
    titleId,
    ordering,
    title,
    multiIf(region != '\\N', region, NULL) AS region,
    multiIf(language != '\\N', language, NULL) AS language,
    multiIf(types != '\\N', types, NULL) AS types,
    multiIf(attributes != '\\N', attributes, NULL) AS attributes,
    CAST(isOriginalTitle AS UInt8) AS isOriginalTitle
FROM file('/var/lib/clickhouse/user_files/title.akas.tsv', TabSeparatedWithNames);

INSERT INTO imdb.title_crew
SELECT
    tconst,
    multiIf(directors != '\\N', directors, NULL) AS directors,
    multiIf(writers != '\\N', writers, NULL) AS writers
FROM file('/var/lib/clickhouse/user_files/title.crew.tsv', TabSeparatedWithNames);

INSERT INTO imdb.title_episode
SELECT
    tconst,
    parentTconst,
    multiIf((seasonNumber = '\\N') OR (seasonNumber = ''), NULL, toUInt32(seasonNumber)) AS seasonNumber,
    multiIf((episodeNumber = '\\N') OR (episodeNumber = ''), NULL, toUInt32(episodeNumber)) AS episodeNumber
FROM file(
    '/var/lib/clickhouse/user_files/title.episode.tsv',
    'TabSeparatedWithNames',
    'tconst String, parentTconst String, seasonNumber String, episodeNumber String'
);

INSERT INTO imdb.title_principals
SELECT
    tconst,
    ordering,
    nconst,
    category,
    multiIf(job != '\\N', job, NULL) AS job,
    multiIf(characters != '\\N', characters, NULL) AS characters
FROM file('/var/lib/clickhouse/user_files/title.principals.tsv', TabSeparatedWithNames);

INSERT INTO imdb.title_ratings
SELECT
    tconst,
    averageRating,
    numVotes
FROM file('/var/lib/clickhouse/user_files/title.ratings.tsv', TabSeparatedWithNames);
