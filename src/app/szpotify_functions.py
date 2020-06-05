import database


SONG_ACTION_INTERFACE = """
Choose operation on this song:
'like_song'
'add_to_playlist'
'esc' previous menu
YOUR CHOICE:
"""

PLAYLIST_INTERFACE = """
Enter:
'L' to list all your playlist
'C' to create playlist
'D' to delete playlist
'L_S' list songs from playlits
'esc' previous menu
YOUR CHOICE:
"""

SONG_PLAYLIST_ACTION = """
Enter:
'D' to delete song from playlist
'esc' previous menu
YOUR CHOICE:
"""

ALBUM_ACTION_INTERFACE = """
Enter:
'L' to like album
'P' to list songs in album
'esc' previous menu
YOUR CHOICE:
"""

ARTIST_ACTION_INTERFACE = """
Enter:
'L' to like artist
'P' to list artist songs
'esc' previous menu
YOUR CHOICE:
"""

LIKED_SONGS_INTERFACE = """
Enter:
'D' to delete song from liked songs
'esc' previous menu
YOUR CHOICE:
"""

LIKED_ARTISTS_INTERFACE = """
Enter:
'D' to delete artist from liked artists
'esc' previous menu
YOUR CHOICE:
"""

def log_in():
    nick_name = input("Enter your nickname: ")
    password = input("Enter your password: ")
    user_id = 0
    for user in database.get_all_users():
        if nick_name == user['user_nickname'] and password == user['user_password']:
            user_id = user['user_id']

    if user_id != 0:
        print(f"Login was successfull")
        return user_id
    else:
        print("Login failed")
        return user_id


def register():
    nick_name = input("Enter your nickname: ")
    password = input("Enter your passowrd: ")
    email = input("Enter your email(name@email.com): ")
    join_date = input("Enter current date(YYYY-MM-DD): ")
    first_name = input("Enter your firstname: ")
    last_name = input("Enter your last name: ")
    phone_number = input("Enter your phone number(123123123): ")
    birth_date = input("Enter your birth date(YYYY-MM-DD): ")
    country = input("Enter your country(PL,DE,CZ,TH,US,CA,AU,GB): ")
    gender = input("Enter your gender(Male,Female,Other): ")
    database.add_user(nick_name, password, email, join_date, first_name, last_name, phone_number, birth_date, country, gender)


def search_songs(user_id):       #id - user_id
    s_song = input("Enter song name: ")
    correct = False
    song_id = 0
    for song in database.get_all_songs():
        if s_song == song['song_name']:
            correct = True
            song_id = song['song_id']

    if correct and user_id != 0:
        print(f"Song \'{s_song}\' has been found in our database")
        song_action(user_id, song_id)
    elif correct and user_id == 0:
        print(f"Song \'{s_song}\' has been found in our database")
    else:
        print("Song that you are looking for doesn't exist in our database")


def search_albums(user_id):
    s_album = input("Enter album name: ")
    correct = False
    album_id = 0

    for album in database.get_all_albums():
        if s_album == album['album_name']:
            correct = True
            album_id = album['album_id']

    if correct and user_id != 0:
        print(f"Album \'{s_album}\' has been found in our database")
        album_action(user_id, album_id)
    elif correct and user_id == 0:
        print(f"Album \'{s_album}\' has been found in our database")
    else:
        print("Album that you are looking for doesn't exist in our database")


def search_artist(user_id):
    artist_id = 0
    s_artist = input("Enter artist name: ")
    correct = False

    for artist in database.get_all_artists():
        if s_artist == artist['artist_name']:
            correct = True
            artist_id = artist['artist_id']

    if correct and user_id != 0:
        print(f"Artist \'{s_artist}\' has been found in our database")
        artist_action(user_id, artist_id)
    elif correct and user_id == 0:
        print(f"Artist \'{s_artist}\' has been found in our database")
    else:
        print("Artist that you are looking for doesn't exist in our database")

def playlist(id):     #id - user_id
    user_id = id
    user_input = input(PLAYLIST_INTERFACE)

    while user_input != 'esc':
        if user_input == 'L':
            print("Your Playlists:")
            for playlists in database.get_all_playlist(user_id):
                print(f"{playlists['playlist_id']}. {playlists['playlist_name']}")
        elif user_input == 'C':
            user_input = input("Enter name for playlist: ")
            database.create_playlist(user_id, user_input)
        elif user_input == 'D':
            user_input = input("Enter playlist name that you want delete: ")
            database.delete_playlist(id, user_input)
        elif user_input == 'L_S':                          ############## zrobic funkcje bo za dlugie to
            user_input_2 = input("Enter playlist name: ")
            result = database.get_playlist_songs(id, user_input_2)
            playlist_id = result[0]['playlist_id']

            for song in result:
                print(f"{song['song_id']}. {song['song_name']}")

            user_input_3 = input(SONG_PLAYLIST_ACTION)
            while user_input_3 != 'esc':
                if user_input_3 == 'D':
                    song_id_input = input("Enter song id: ")
                    database.delete_from_playlist(playlist_id, song_id_input)
                else:
                    print("Unknown command! Try again.")
                user_input_3 = input(SONG_PLAYLIST_ACTION)
        else:
            print("Unknown command! try again.")
        user_input = input(PLAYLIST_INTERFACE)


def liked_songs(user_id):
    print("Your liked songs:")

    for song in database.get_all_liked_songs(user_id):
        print(f"{song['song_id']} {song['song_name']}")

    user_input = input(LIKED_SONGS_INTERFACE)

    while user_input != 'esc':
        if user_input == 'D':
            song_id_input = input("Enter song id to delete: ")
            database.delete_from_liked_songs(user_id, song_id_input)
        else:
            print("Unknown command! try again")
            liked_songs(user_id)
        user_input = input(LIKED_SONGS_INTERFACE)


def liked_artists(user_id):
    print("Your liked artists:")
    for artist in database.get_all_liked_artists(user_id):
        print(f"{artist['artist_id']} {artist['artist_name']}")
    user_input = input(LIKED_ARTISTS_INTERFACE)

    while user_input != 'esc':
        if user_input == 'D':
            artist_id_input = input("Enter artist id to delete: ")
            database.delete_from_liked_artists(user_id, artist_id_input)
        else:
            print("Unknown command! try again")
            liked_artists(user_id)
        user_input = input(LIKED_ARTISTS_INTERFACE)


def song_action(user_id, song_id):   # id - user_id   s_id - song_id
    user_input = input(SONG_ACTION_INTERFACE)

    while user_input != 'esc':
        if user_input == 'like_song':
            database.add_liked_song(user_id, song_id)
        elif user_input == 'add_to_playlist':
            p_name = input("Enter playlist name: ")
            p_id = 0  #playlist id
            user_p_id = 0  # user_p_id - playlist ---> user_id (databases)

            for playlist in database.get_all_playlist(user_id):
                if p_name == playlist['playlist_name']:
                    p_id = playlist['playlist_id']
                    user_p_id = playlist['user_id']

            if p_id != 0 and user_p_id == user_id:
                database.add_to_playlist(p_id, song_id)
            else:
                print("Playlist name not found in your saved playlists")
                song_action(user_id, song_id)
        else:
            print("Unknown command! try again.")
            song_action(user_id, song_id)
        user_input = input(SONG_ACTION_INTERFACE)


def album_action(user_id, album_id):
    user_input = input(ALBUM_ACTION_INTERFACE)

    while user_input != 'esc':
        if user_input == 'L':
            database.add_liked_album(user_id, album_id)
        elif user_input == 'P':
            for s_album in database.list_album_songs(album_id):
                print(f"{s_album['song_name']}")
        else:
            print("Unknown command! try again.")
            album_action(user_id, album_id)

        user_input = input(ALBUM_ACTION_INTERFACE)


def artist_action(user_id, artist_id):
    user_input= input(ARTIST_ACTION_INTERFACE)

    while user_input != 'esc':
        if user_input == 'L':
            database.add_liked_artist(user_id, artist_id)
        elif user_input == 'P':
            result = database.list_artist_songs(artist_id)
            for s_artist in result:
                print(f"'{s_artist['song_name']}' in '{s_artist['album_name']}' album")
        else:
            print("Unknown command! try again.")
            artist_id(user_id, artist_id)
        user_input = input(ARTIST_ACTION_INTERFACE)