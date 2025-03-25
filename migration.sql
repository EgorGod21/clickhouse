INSERT INTO imdb.name_basics
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.name_basics',
    'default',
    '12345'
);

INSERT INTO imdb.title_basics
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_basics',
    'default',
    '12345'
);

INSERT INTO imdb.title_akas
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_akas',
    'default',
    '12345'
);

INSERT INTO imdb.title_crew
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_crew',
    'default',
    '12345'
);

INSERT INTO imdb.title_episode
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_episode',
    'default',
    '12345'
);

INSERT INTO imdb.title_principals
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_principals',
    'default',
    '12345'
);

INSERT INTO imdb.title_ratings
SELECT * FROM remote(
    'clickhouse-server-1:9000',
    'imdb.title_ratings',
    'default',
    '12345'
);
