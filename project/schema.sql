CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    biography TEXT
);

CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    artist_id INT REFERENCES artists(id)
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255) NOT NULL
);

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre_id INT REFERENCES genres(id),
    album_id INT REFERENCES albums(id)
);

CREATE TABLE song_artists (
    song_id INT REFERENCES songs(id),
    artist_id INT REFERENCES artists(id),
    PRIMARY KEY (song_id, artist_id)
);

CREATE TABLE lyrics (
    id SERIAL PRIMARY KEY,
    song_id INT REFERENCES songs(id),
    lyric TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE playlists (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    name VARCHAR(255) NOT NULL
);

CREATE TABLE playlist_songs (
    playlist_id INT REFERENCES playlists(id),
    song_id INT REFERENCES songs(id),
    PRIMARY KEY (playlist_id, song_id)
);

CREATE OR REPLACE FUNCTION create_liked_songs_playlist()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO playlists (user_id, name)
  VALUES (NEW.id, 'Liked Songs');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER create_liked_songs_playlist_trigger
AFTER INSERT ON users
FOR EACH ROW
EXECUTE PROCEDURE create_liked_songs_playlist();

CREATE VIEW user_playlists_view AS
SELECT
  u.id AS user_id,
  u.username,
  p.id AS playlist_id,
  p.name AS playlist_name
FROM users AS u
JOIN playlists AS p
  ON u.id = p.user_id;

CREATE VIEW playlist_songs_view AS
SELECT
  p.id AS playlist_id,
  p.name AS playlist_name,
  s.id AS song_id,
  s.title AS song_title
FROM playlists AS p
JOIN playlist_songs AS ps
  ON p.id = ps.playlist_id
JOIN songs AS s
  ON ps.song_id = s.id;

CREATE INDEX artists_name_idx ON artists(name);

CREATE INDEX albums_title_idx ON albums(title);

CREATE INDEX songs_title_idx ON songs(title);

CREATE INDEX genres_genre_idx ON genres(genre);

CREATE INDEX users_username_idx ON users(username);

CREATE INDEX playlists_name_idx ON playlists(name);

CREATE INDEX song_artists_song_id_idx ON song_artists(song_id);
CREATE INDEX song_artists_artist_id_idx ON song_artists(artist_id);

CREATE INDEX playlist_songs_playlist_id_idx ON playlist_songs(playlist_id);
CREATE INDEX playlist_songs_song_id_idx ON playlist_songs(song_id);

CREATE INDEX lyrics_song_id_idx ON lyrics(song_id);

CREATE INDEX albums_artist_id_idx ON albums(artist_id);

CREATE INDEX songs_album_id_idx ON songs(album_id);

CREATE INDEX songs_genre_id_idx ON songs(genre_id);

CREATE INDEX playlists_user_id_idx ON playlists (user_id);
