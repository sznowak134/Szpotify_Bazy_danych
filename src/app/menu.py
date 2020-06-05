import database
import szpotify_functions
import sys


MENU_INTERFACE = """
WELCOME IN OUR SZPOTIFY PROJECT!

Enter:
'log' to login
'reg' to register
'not' to use without login
'esc' to exit
YOUR CHOICE:
"""

USER_LIBRARY = """
Enter:
'search_s' to search song
'search_a' to search album
'search_ar' to search artist
'playlist' to go to your playlists
'liked_songs' to list all liked songs
'liked_artists' to list all liked artists
'esc' previous menu
YOUR CHOICE:
"""

NOT_LOGGED_IN_MENU = """
Enter:
'search_s' to search song
'search_a' to search album
'search_ar' to search artist
'esc' previous menu
YOUR CHOICE:
"""

#Uzytkownik nie zalogowany będzie mogł tylko wyszukiwac piosenki, albumy i artystow
def menu():
    user_input = input(MENU_INTERFACE)
    user_id = 0
    if user_input == 'log':
        user_id = szpotify_functions.log_in()
    elif user_input == 'reg':
        szpotify_functions.register()
        menu()
    elif user_input == 'not':
        not_log_menu()
    elif user_input == 'esc':
        database.close_database()
        sys.exit(0)
    else:
        print("Unknown command! try again.")

    if user_id != 0:
        log_menu(user_id)
    else:
        menu()

def log_menu(user_id):
    user_input = input(USER_LIBRARY)
    while True:
        if user_input == 'search_s':
            szpotify_functions.search_songs(user_id)
        elif user_input == 'search_a':
            szpotify_functions.search_albums(user_id)
        elif user_input == 'search_ar':
            szpotify_functions.search_artist(user_id)
        elif user_input == 'playlist':
            szpotify_functions.playlist(user_id)
        elif user_input == 'liked_songs':
            szpotify_functions.liked_songs(user_id)
        elif user_input == 'liked_artists':
            szpotify_functions.liked_artists(user_id)
        elif user_input == 'esc':
            menu()
        else:
            print("Unknown command! try again.")

        user_input = input(USER_LIBRARY)


def not_log_menu():
    print("When you are not logged in you can only search songs")
    user_input = input(NOT_LOGGED_IN_MENU)
    user_id = 0
    while True:
        if user_input == 'search_s':
            szpotify_functions.search_songs(user_id)
        elif user_input == 'serarch_a':
            szpotify_functions.search_albums(user_id)
        elif user_input == 'search_ar':
            szpotify_functions.search_artist(user_id)
        elif user_input == 'esc':
            menu()
        else:
            print("Unknown command! try again.")

        user_input = input(NOT_LOGGED_IN_MENU)

menu()