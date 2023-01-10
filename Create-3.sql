CREATE TABLE IF NOT EXISTS Singer (
		singer_id SERIAL PRIMARY KEY, 
		singer_name VARCHAR(35) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
		genre_id SERIAL PRIMARY KEY,
		genre_name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Singer (
		PRIMARY KEY (genre_id, singer_id),
		genre_id integer REFERENCES Genre (genre_id),
		singer_id integer REFERENCES Singer(singer_id)
);

CREATE 	TABLE IF NOT EXISTS Album (
		album_id SERIAL PRIMARY KEY,
		album_name VARCHAR(40) NOT NULL,
		release_album DATE CHECK (release_album>1940-01-01)
);

CREATE TABLE IF NOT EXISTS Album_Singer (
		PRIMARY KEY (album_id, singer_id),
		album_id integer REFERENCES Album (album_id),
		singer_id integer REFERENCES Singer(singer_id)
);

CREATE TABLE IF NOT EXISTS Track (
		track_id SERIAL PRIMARY KEY,
		track_name VARCHAR(30) NOT NULL,
		duration integer NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection (
		collection_id SERIAL PRIMARY KEY,
		collection_name VARCHAR(35) NOT NULL,
		release_collection DATE CHECK (release_collection>1940-01-01)
);

CREATE TABLE IF NOT EXISTS Track_Collection (
		PRIMARY KEY (track_id, collection_id),
		track_id integer REFERENCES Track (track_id),
		collection_id integer REFERENCES Collection (collection_id)
);
