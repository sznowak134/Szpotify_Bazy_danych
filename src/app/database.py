import pymysql
connection = pymysql.Connection(
    host = 'localhost',
    user = 'Szymon',
    password = 'Zaq12wsx',
    db = 'szpotify',
    charset = 'utf8mb4',
    cursorclass = pymysql.cursors.DictCursor
)


def get_all_songs():
    with connection.cursor() as cursor:
        sql = "SELECT `song_name`, `song_id` FROM song"
        cursor.execute(sql)
        result = cursor.fetchall()
        return result


def get_all_users():
    with connection.cursor() as cursor:
        sql = "SELECT `user_nickname`, `user_password`, `user_id` FROM szpotify_user"
        cursor.execute(sql)
        result = cursor.fetchall()
        return result


def add_user(nick_name, password, email, join_date, first_name, last_name, phone_number, birth_date, country, gender):
    gender_id = 1
    country_id = 1
    if country == 'PL':
        country_id = 1
    elif country == 'DE':
        country_id = 2
    elif country == 'CZ':
        country_id = 3
    elif country == 'TH':
        country_id = 4
    elif country == 'US':
        country_id = 5
    elif country == 'CA':
        country_id = 6
    elif country_id == 'AU':
        country_id = 7
    elif country_id == 'GB':
        country_id = 8

    if gender == "Female":
        gender_id = 1
    elif gender == "Male":
        gender_id = 2
    else:
        gender_id = 3


    with connection.cursor() as cursor:
        sql = "INSERT INTO szpotify_user (user_nickname, user_password, user_email, user_join_date, user_first_name, " \
              "user_last_name, user_phone_number, user_birth_date, country_id, gender_id) " \
              "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(sql, (nick_name, password, email, join_date, first_name, last_name, phone_number, birth_date, country_id, gender_id))
        connection.commit()


def get_all_albums():
    with connection.cursor() as cursor:
        sql = "SELECT `album_name`, `album_id` FROM album"
        cursor.execute(sql)
        result = cursor.fetchall()
        return result


def get_all_artists():
    with connection.cursor() as cursor:
        sql = "SELECT `artist_name`, `artist_id` FROM artist"
        cursor.execute(sql)
        result = cursor.fetchall()
        return result


def get_all_playlist(id):
    user_id = id
    with connection.cursor() as cursor:
        sql = "SELECT `playlist_id`, `playlist_name`, `user_id` FROM `playlist` WHERE `user_id` = %s"
        cursor.execute(sql, (user_id))
        result = cursor.fetchall()
        return result


def create_playlist(id, p_name):     #p - playlist id - user_id
    user_id = id
    name = p_name
    with connection.cursor() as cursor:
        sql = "INSERT INTO playlist (playlist_name, user_id) VALUES (%s, %s)"
        cursor.execute(sql, (name, user_id))
        connection.commit()


def delete_playlist(id, playlist_name):
    user_id = id
    p_name = playlist_name
    with connection.cursor() as cursor:
        sql = "DELETE FROM playlist WHERE playlist_name = %s AND user_id = %s"
        cursor.execute(sql, (p_name, user_id))
        connection.commit()


def close_database():
    with connection.cursor():
        print("Database status: 'Closed'")
        connection.close()


def add_liked_song(id, s_id):     # id - user_id  s_id - song_id
    user_id = id
    song_id = s_id
    with connection.cursor() as cursor:
        sql = "INSERT INTO liked_songs (user_id, song_id) VALUES (%s, %s)"
        cursor.execute(sql,(user_id, song_id))
        connection.commit()


def add_to_playlist(playlist_id, song_id):
    s_id = song_id
    p_id = playlist_id

    with connection.cursor() as cursor:
        sql = "INSERT INTO playlist_song (playlist_id, song_id) VALUES (%s, %s)"
        cursor.execute(sql, (p_id, s_id))
        connection.commit()


def get_playlist_songs(user_id, playlist_name):
    p_name = playlist_name
    u_id = user_id

    with connection.cursor() as cursor:
        sql = "SELECT song.song_id, song.song_name, playlist.playlist_id FROM szpotify_user " \
              "INNER JOIN playlist " \
              "ON playlist.user_id = szpotify_user.user_id " \
              "INNER JOIN playlist_song " \
              "ON playlist_song.playlist_id = playlist.playlist_id " \
              "INNER JOIN song " \
              "ON song.song_id = playlist_song.song_id " \
              "INNER JOIN album_song " \
              "ON song.song_id = album_song.song_id " \
              "INNER JOIN album " \
              "ON album.album_id = album_song.album_id " \
              "INNER JOIN artist_album " \
              "ON album.album_id = artist_album.album_id " \
              "INNER JOIN artist " \
              "ON artist.artist_id = artist_album.artist_id " \
              "WHERE szpotify_user.user_id = %s && playlist.playlist_name = %s"
        cursor.execute(sql, (u_id ,p_name))
        result = cursor.fetchall()
        return result



def delete_from_playlist(playlist_id, song_id):
    with connection.cursor() as cursor:
        sql = "DELETE FROM playlist_song WHERE playlist_id = %s AND song_id = %s"
        cursor.execute(sql, (playlist_id, song_id))
        connection.commit()


def add_liked_album(user_id, album_id):
    u_id = user_id
    a_id = album_id

    with connection.cursor() as cursor:
        sql = "INSERT INTO liked_albums (user_id, album_id) VALUES (%s, %s)"
        cursor.execute(sql, (u_id, a_id))
        connection.commit()


def list_album_songs(album_id):
    a_id = album_id

    with connection.cursor() as cursor:
        sql = "SELECT album.album_name, song.song_name FROM song " \
              "INNER JOIN album_song " \
              "ON song.song_id = album_song.song_id " \
              "INNER JOIN album " \
              "ON album.album_id = album_song.album_id " \
              "WHERE album.album_id = %s"
        cursor.execute(sql, (a_id))
        result = cursor.fetchall()
        return result


def add_liked_artist(user_id, artist_id):
    u_id = user_id
    a_id = artist_id

    with connection.cursor() as cursor:
        sql = "INSERT INTO liked_artists (user_id, artist_id) VALUES (%s, %s)"
        cursor.execute(sql, (user_id, artist_id))
        connection.commit()


def list_artist_songs(artist_id):
    ar_id = artist_id

    with connection.cursor() as cursor:
        sql = "SELECT artist.artist_name, album.album_name, song.song_name FROM song " \
              "INNER JOIN album_song " \
              "ON song.song_id = album_song.song_id " \
              "INNER JOIN album " \
              "ON album.album_id = album_song.album_id " \
              "INNER JOIN artist_album " \
              "ON album.album_id = artist_album.album_id " \
              "INNER JOIN artist " \
              "ON artist.artist_id = artist_album.artist_id " \
              "WHERE artist.artist_id = %s"
        cursor.execute(sql, (ar_id))
        result = cursor.fetchall()
        return result


def get_all_liked_songs(user_id):
    with connection.cursor() as cursor:
        sql = "SELECT song.song_id, song.song_name FROM liked_songs " \
              "INNER JOIN song " \
              "ON song.song_id = liked_songs.song_id " \
              "INNER JOIN album_song " \
              "ON album_song.song_id = song.song_id " \
              "INNER JOIN album " \
              "ON album.album_id = album_song.album_id " \
              "INNER JOIN artist_album " \
              "ON artist_album.album_id = album.album_id " \
              "INNER JOIN artist " \
              "ON artist.artist_id = artist_album.artist_id " \
              "INNER JOIN szpotify_user " \
              "ON szpotify_user.user_id = liked_songs.user_id " \
              "WHERE szpotify_user.user_id = %s"
        cursor.execute(sql, (user_id))
        result = cursor.fetchall()
        return result


def delete_from_liked_songs(user_id, song_id):
    with connection.cursor() as cursor:
        sql = "DELETE FROM liked_songs WHERE user_id = %s AND song_id = %s"
        cursor.execute(sql, (user_id, song_id))
        connection.commit()


def get_all_liked_artists(user_id):
    with connection.cursor() as cursor:
        sql = "SELECT artist.artist_id, artist.artist_name FROM liked_artists " \
              "INNER JOIN artist " \
              "ON artist.artist_id = liked_artists.artist_id " \
              "INNER JOIN szpotify_user " \
              "ON szpotify_user.user_id = liked_artists.user_id " \
              "WHERE szpotify_user.user_id = %s"
        cursor.execute(sql, (user_id))
        result = cursor.fetchall()
        return result


def delete_from_liked_artists(user_id, artist_id):
    with connection.cursor() as cursor:
        sql = "DELETE FROM liked_artists WHERE user_id = %s AND artist_id = %s"
        cursor.execute(sql, (user_id, artist_id))
        connection.commit()