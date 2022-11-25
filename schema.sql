DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS genres;
CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR NOT NULL
);

DROP TABLE IF EXISTS labels;
CREATE TABLE labels (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR NOT NULL,
	color VARCHAR NOT NULL
);

DROP TABLE IF EXISTS games;
CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  multiplayer VARCHAR NOT NULL,
  last_played_at DATE NOT NULL,
  author_id INT NULL REFERENCES authors(id),
  genre_id INT NULL REFERENCES genres(id),
  label_id INT NULL REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS music_albums;
CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT NULL REFERENCES genres(id),
  author_id INT NULL REFERENCES authors(id),
  label_id INT NULL REFERENCES labels(id),
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS books;
CREATE TABLE books (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  genre_id INT NULL REFERENCES genres(id),
  author_id INT NULL REFERENCES authors(id),
  label_id INT NULL REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR NOT NULL,
  cover_state VARCHAR NOT NULL
);