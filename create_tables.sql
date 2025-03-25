CREATE DATABASE IF NOT EXISTS imdb;

DROP TABLE IF EXISTS imdb.name_basics;
DROP TABLE IF EXISTS imdb.title_basics;
DROP TABLE IF EXISTS imdb.title_akas;
DROP TABLE IF EXISTS imdb.title_crew;
DROP TABLE IF EXISTS imdb.title_episode;
DROP TABLE IF EXISTS imdb.title_principals;
DROP TABLE IF EXISTS imdb.title_ratings;

CREATE TABLE IF NOT EXISTS imdb.name_basics
(
    nconst String,
    primaryName Nullable(String),
    birthYear Nullable(UInt16),
    deathYear Nullable(UInt16),
    primaryProfession Nullable(String),
    knownForTitles Nullable(String)
)
ENGINE = MergeTree()
ORDER BY nconst;

CREATE TABLE IF NOT EXISTS imdb.title_basics
(
    tconst String,
    titleType String,
    primaryTitle String,
    originalTitle String,
    isAdult UInt8,
    startYear Nullable(UInt16),
    endYear Nullable(UInt16),
    runtimeMinutes Nullable(UInt32),
    genres Nullable(String)
)
ENGINE = MergeTree()
ORDER BY tconst;

CREATE TABLE IF NOT EXISTS imdb.title_akas
(
    titleId String,
    ordering UInt32,
    title String,
    region Nullable(String),
    language Nullable(String),
    types Nullable(String),
    attributes Nullable(String),
    isOriginalTitle UInt8
)
ENGINE = MergeTree()
ORDER BY titleId;

CREATE TABLE IF NOT EXISTS imdb.title_crew
(
    tconst String,
    directors Nullable(String),
    writers Nullable(String)
)
ENGINE = MergeTree()
ORDER BY tconst;

CREATE TABLE IF NOT EXISTS imdb.title_episode
(
    tconst String,
    parentTconst String,
    seasonNumber Nullable(UInt32),
    episodeNumber Nullable(UInt32)
)
ENGINE = MergeTree()
ORDER BY tconst;

CREATE TABLE IF NOT EXISTS imdb.title_principals
(
    tconst String,
    ordering UInt32,
    nconst String,
    category String,
    job Nullable(String),
    characters Nullable(String)
)
ENGINE = MergeTree()
ORDER BY tconst;

CREATE TABLE IF NOT EXISTS imdb.title_ratings
(
    tconst String,
    averageRating Float32,
    numVotes UInt32
)
ENGINE = MergeTree()
ORDER BY tconst;
