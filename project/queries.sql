-- Insert the artist "King Gnu"
INSERT INTO artists (name, biography) VALUES ('King Gnu', 'Formed in Tokyo in 2013, King Gnu is a rock band known for their genre-bending sound. Fronted by songwriter Daiki Tsuneta, the band features vocalist and keyboardist Satoru Iguchi, bassist Kazuki Arai, and drummer Yu Seki. Their catchy tunes, energetic live shows, and unique blend of pop, rock, and other influences have propelled them to fame in Japan and internationally.');

-- Insert the album "Ceremony"
INSERT INTO albums (title, release_date, artist_id) 
    VALUES ('Ceremony', '2020-02-19', (SELECT id FROM artists WHERE name = 'King Gnu'));

-- Insert the genre "Rock"
INSERT INTO genres (genre) VALUES ('Rock');

-- Insert the song "Hakujitsu"
INSERT INTO songs (title, genre_id, album_id) 
    VALUES ('Hakujitsu', (SELECT id FROM genres WHERE genre = 'Rock'), (SELECT id FROM albums WHERE title = 'Ceremony'));

-- Link "Hakujitsu" to "King Gnu" in the song_artists table
INSERT INTO song_artists (song_id, artist_id) 
    VALUES ((SELECT id FROM songs WHERE title = 'Hakujitsu'), (SELECT id FROM artists WHERE name = 'King Gnu'));

-- Insert lyrics for "Hakujitsu" (optional)
INSERT INTO lyrics (song_id, lyric) 
    VALUES ((SELECT id FROM songs WHERE title = 'Hakujitsu'), 
        '時には誰かを
        知らず知らずのうちに
        傷つけてしまったり
        失ったりして初めて
        犯した罪を知る
        戻れないよ、昔のようには
        煌めいて見えたとしても
        明日へと歩き出さなきゃ
        雪が降りしきろうとも
        今の僕には
        何ができるの？
        何になれるの？
        誰かのために生きるなら
        正しいことばかり
        言ってらんないよな
        どこかの街で
        また出逢えたら
        僕の名前を
        覚えていますか？
        その頃にはきっと
        春風が吹くだろう
        真っ新に生まれ変わって
        人生一から始めようが
        へばりついて離れない
        地続きの今を歩いているんだ
        真っ白に全てさよなら
        降りしきる雪よ
        全てを包み込んでくれ
        今日だけは
        全てを隠してくれ
        もう戻れないよ、昔のようには
        羨んでしまったとしても
        明日へと歩き出さなきゃ
        雪が降りしきろうとも
        いつものように笑ってたんだ
        分かり合えると思ってたんだ
        曖昧なサインを見落として
        途方のない間違い探し
        季節を越えて
        また出逢えたら
        君の名前を
        呼んでもいいかな
        その頃にはきっと
        春風が吹くだろう
        真っ新に生まれ変わって
        人生一から始めようが
        首の皮一枚繋がった
        どうしようもない今を
        生きていくんだ
        真っ白に全てさよなら
        降りしきる雪よ
        今だけはこの心を凍らせてくれ
        全てを忘れさせてくれよ
        朝目覚めたら
        どっかの誰かに
        なってやしないかな
        なれやしないよな
        聞き流してくれ
        忙しない日常の中で
        歳だけを重ねた
        その向こう側に
        待ち受けるのは
        天国か地獄か
        いつだって人は鈍感だもの
        わかりゃしないんだ肚の中
        それでも愛し愛され
        生きて行くのが定めと知って
        後悔ばかりの人生だ
        取り返しのつかない過ちの
        一つや二つくらい
        誰にでもあるよな
        そんなんもんだろう
        うんざりするよ
        真っ新に生まれ変わって
        人生一から始めようが
        へばりついて離れない
        地続きの今を歩いて行くんだ
        真っ白に全てさようなら
        降りしきる雪よ
        全てを包み込んでくれ
        今日だけは
        全てを隠してくれ');

-- Insert the user
INSERT INTO users (username, password) VALUES ('Neto', 'password');

-- Add "Hakujitsu" to the "Liked Songs" playlist
INSERT INTO playlist_songs (playlist_id, song_id)
    SELECT 
    (SELECT id FROM playlists WHERE name = 'Liked Songs' AND user_id = (SELECT id FROM users WHERE username = 'Neto')),
    (SELECT id FROM songs WHERE title = 'Hakujitsu');

-- Select all users
SELECT * FROM users;

-- Select all information from the user_playlists_view
SELECT * FROM user_playlists_view
    WHERE user_id = (SELECT id FROM users WHERE username = 'Neto');

-- Select the liked songs playlist
SELECT * FROM playlist_songs_view
    WHERE playlist_id = (SELECT id FROM playlists WHERE name = 'Liked Songs' AND user_id = (SELECT id FROM users WHERE username = 'Neto'));

-- Select all artists
SELECT * FROM artists;

-- Select all albums
SELECT * FROM albums;

-- Select all genres
SELECT * FROM genres;

-- Select all songs
SELECT * FROM songs;

-- Select all lyrics
SELECT * FROM lyrics;
