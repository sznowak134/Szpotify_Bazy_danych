-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 31 Maj 2020, 17:05
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `Szpotify`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album`
--

CREATE TABLE `album` (
  `album_id` int(11) NOT NULL,
  `album_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `album_release_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `album`
--

INSERT INTO `album` (`album_id`, `album_name`, `album_release_date`) VALUES
(1, 'Hardwired...To Self-Destruct', '2016-11-18'),
(2, 'The Getaway', '2016-06-17'),
(3, 'Changes', '2020-02-14'),
(4, 'Highway to Hell', '1980-02-19'),
(5, 'Rock or Bust', '2014-11-28'),
(6, 'Ordinary Man', '2020-02-21');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album_song`
--

CREATE TABLE `album_song` (
  `album_song_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `album_song`
--

INSERT INTO `album_song` (`album_song_id`, `album_id`, `song_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 2, 7),
(9, 3, 8),
(10, 4, 9),
(11, 4, 10),
(12, 4, 11),
(13, 4, 12),
(14, 4, 13),
(15, 5, 14),
(16, 5, 15),
(17, 5, 16),
(18, 5, 17),
(19, 5, 18),
(20, 5, 19),
(21, 6, 20),
(22, 6, 21),
(23, 6, 22),
(24, 6, 23),
(25, 6, 24);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL,
  `artist_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `artist_bio` varchar(1000) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `artist`
--

INSERT INTO `artist` (`artist_id`, `artist_name`, `artist_bio`, `country_id`) VALUES
(1, 'Metallica', 'Metallica is an American heavy metal band. The band was formed in 1981 in Los Angeles by vocalist/guitarist James Hetfield and drummer Lars Ulrich, and has been based in San Francisco for most of its career. The band\'s fast tempos, instrumentals and aggressive musicianship made them one of the founding \"big four\" bands of thrash metal, alongside Megadeth, Anthrax and Slayer. Metallica\'s current lineup comprises founding members and primary songwriters Hetfield and Ulrich, longtime lead guitarist Kirk Hammett and bassist Robert Trujillo. Guitarist Dave Mustaine (who went on to form Megadeth after being fired from the band) and bassists Ron McGovney, Cliff Burton (who died in a bus accident in Sweden in 1986) and Jason Newsted are former members of the band.', 5),
(2, 'Red Hot Chili Peppers', 'Red Hot Chili Peppers (commonly abbreviated as RHCP) are an American rock band formed in Los Angeles in 1983. Their music incorporates elements of alternative rock, funk, punk rock and psychedelic rock. The band consists of vocalist Anthony Kiedis, guitarist John Frusciante, bassist Flea, and drummer Chad Smith. With over 80 million records sold worldwide, Red Hot Chili Peppers are one of the best-selling bands of all time. They are the most successful band in the history of alternative rock radio, with the records for most number-one singles (13), most cumulative weeks at number one (85) and most top-ten songs (25) on the Billboard Alternative Songs chart.[1] They have won six Grammy Awards, and in 2012 were inducted into the Rock and Roll Hall of Fame.', 5),
(3, 'Justin Bieber', 'The worst musician ever.', 6),
(4, 'AC/DC', 'AC/DC are an Australian rock band formed in Sydney in 1973 by Scottish-born brothers Malcolm and Angus Young.Although their music has been variously described as hard rock, blues rock, and heavy metal, the band themselves call it simply \"rock and roll\".', 7),
(5, 'Ozzy Osbourne', 'John Michael \"Ozzy\" Osbourne (born 3 December 1948) is an English singer, songwriter, actor, and television personality. He rose to prominence during the 1970s as the lead vocalist of the heavy metal band Black Sabbath, during which he adopted the nickname the \"Prince of Darkness\". Osbourne was fired from the band in 1979 due to alcohol and drug problems, but he went on to have a successful solo career, releasing 12 studio albums, the first seven of which were awarded multi-platinum certifications in the US. Osbourne has since reunited with Black Sabbath on several occasions. He rejoined in 1997 and helped record the group\'s final studio album 13 (2013), before they embarked on a farewell tour which culminated in a final performance in their home city, Birmingham, England, in February 2017. His longevity and success have earned him the informal title of \"Godfather of Heavy Metal\".', 8),
(6, 'Elton John', 'Sir Elton Hercules John CH CBE (born Reginald Kenneth Dwight; 25 March 1947) is an English singer, songwriter, pianist, and composer. He has worked with lyricist Bernie Taupin since 1967; they have collaborated on more than 30 albums. John has sold more than 300 million records, making him one of the best-selling music artists. He has more than fifty Top 40 hits in the UK Singles Chart and US Billboard Hot 100, including seven number ones in the UK and nine in the US, as well as seven consecutive number-one albums in the US. His tribute single \"Candle in the Wind 1997\", rewritten in dedication to Diana, Princess of Wales, sold over 33 million copies worldwide and is the best-selling single in the history of the UK and US singles charts. He has also produced records and occasionally acted in films. John owned Watford F.C. from 1976 to 1987 and from 1997 to 2002. He is an honorary life president of the club.', 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artist_album`
--

CREATE TABLE `artist_album` (
  `artist_album_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `artist_album`
--

INSERT INTO `artist_album` (`artist_album_id`, `artist_id`, `album_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 4, 5),
(6, 5, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `artist_song`
--

CREATE TABLE `artist_song` (
  `artist_song_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `artist_song_artist_primary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `artist_song`
--

INSERT INTO `artist_song` (`artist_song_id`, `artist_id`, `song_id`, `artist_song_artist_primary`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 2, 7, 1),
(8, 3, 8, 1),
(9, 4, 9, 1),
(10, 4, 10, 1),
(11, 4, 11, 1),
(12, 4, 12, 1),
(13, 4, 13, 1),
(14, 4, 14, 1),
(15, 4, 15, 1),
(16, 4, 16, 1),
(17, 4, 17, 1),
(18, 4, 18, 1),
(19, 4, 19, 1),
(20, 5, 20, 1),
(21, 5, 21, 1),
(23, 5, 22, 1),
(24, 5, 23, 1),
(25, 6, 23, 2),
(26, 5, 24, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `country_short` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `country`
--

INSERT INTO `country` (`country_id`, `country_name`, `country_short`) VALUES
(1, 'Poland', 'PL'),
(2, 'Germany', 'DE'),
(3, 'Czechia', 'CZ'),
(4, 'Thailand', 'TH'),
(5, 'USA', 'US'),
(6, 'Canada', 'CA'),
(7, 'Australia', 'AU'),
(8, 'United Kingdom', 'GB');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `gender`
--

INSERT INTO `gender` (`gender_id`, `gender_name`) VALUES
(1, 'Female'),
(2, 'Male'),
(3, 'Not binar');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked_albums`
--

CREATE TABLE `liked_albums` (
  `liked_albums_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `liked_albums_add_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `liked_albums`
--

INSERT INTO `liked_albums` (`liked_albums_id`, `user_id`, `album_id`, `liked_albums_add_date`) VALUES
(1, 1, 1, '2020-04-28'),
(2, 1, 2, '2020-04-28'),
(3, 2, 3, '2020-04-28'),
(4, 1, 5, '2020-05-31'),
(5, 1, 6, '2020-05-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked_artists`
--

CREATE TABLE `liked_artists` (
  `liked_artists_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `liked_artists_add_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `liked_artists`
--

INSERT INTO `liked_artists` (`liked_artists_id`, `user_id`, `artist_id`, `liked_artists_add_date`) VALUES
(1, 1, 1, '2020-04-28'),
(2, 1, 5, '2020-05-31'),
(3, 1, 6, '2020-05-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `liked_songs`
--

CREATE TABLE `liked_songs` (
  `liked_songs_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `liked_songs_add_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `liked_songs`
--

INSERT INTO `liked_songs` (`liked_songs_id`, `user_id`, `song_id`, `liked_songs_add_date`) VALUES
(1, 1, 3, '2020-04-28'),
(2, 1, 1, '2020-04-28'),
(3, 2, 8, '2020-04-28'),
(4, 1, 9, '2020-05-31'),
(5, 1, 17, '2020-05-31'),
(6, 1, 23, '2020-05-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `playlist`
--

CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL,
  `playlist_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `playlist`
--

INSERT INTO `playlist` (`playlist_id`, `playlist_name`, `user_id`) VALUES
(1, 'Cool music', 1),
(2, '<3 metal', 1),
(3, '<3 BIEBER', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `playlist_song`
--

CREATE TABLE `playlist_song` (
  `playlist_song_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `playlist_song_add_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `playlist_song`
--

INSERT INTO `playlist_song` (`playlist_song_id`, `playlist_id`, `song_id`, `playlist_song_add_date`) VALUES
(1, 1, 3, '2020-04-28'),
(2, 1, 2, '2020-04-28'),
(3, 1, 7, '2020-04-28'),
(4, 2, 2, '2020-04-28'),
(5, 2, 4, '2020-04-28'),
(6, 3, 8, '2020-04-28'),
(7, 1, 23, '2020-05-31'),
(8, 1, 22, '2020-05-31'),
(9, 2, 20, '2020-05-31');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `song`
--

CREATE TABLE `song` (
  `song_id` int(11) NOT NULL,
  `song_name` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `song`
--

INSERT INTO `song` (`song_id`, `song_name`) VALUES
(1, 'Hardwired'),
(2, 'Atlas, Rise!'),
(3, 'Now That We\'re Dead'),
(4, 'Moth into Flame'),
(5, 'Dream No More'),
(6, 'Halo On Fire'),
(7, 'Dark Necessities'),
(8, 'Yummy'),
(9, 'Highway to Hell'),
(10, 'Girls Got Rhythm'),
(11, 'Walk All Over You'),
(12, 'Touch Too Much'),
(13, 'Beating Around the Bush'),
(14, 'Rock or Bust'),
(15, 'Play Ball'),
(16, 'Rock the Blues Away'),
(17, 'Miss Adventure'),
(18, 'Dogs of War'),
(19, 'Got Some Rock & Roll Thunder'),
(20, 'Straight to Hell'),
(21, 'All My Life'),
(22, 'Goodbye'),
(23, 'Ordinary Man'),
(24, 'Under the Graveyard');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szpotify_user`
--

CREATE TABLE `szpotify_user` (
  `user_id` int(11) NOT NULL,
  `user_nickname` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_polish_ci NOT NULL,
  `user_join_date` date NOT NULL DEFAULT current_timestamp(),
  `user_first_name` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `user_last_name` varchar(50) COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `user_phone_number` int(11) DEFAULT NULL,
  `user_birth_date` date DEFAULT current_timestamp(),
  `country_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `szpotify_user`
--

INSERT INTO `szpotify_user` (`user_id`, `user_nickname`, `user_password`, `user_email`, `user_join_date`, `user_first_name`, `user_last_name`, `user_phone_number`, `user_birth_date`, `country_id`, `gender_id`) VALUES
(1, 'Radziu', 'Password123', 'radoslaw@email.com', '2020-04-28', 'Radosław', 'Niestrój', 123123123, '2000-01-13', 1, 2),
(2, 'Szymek', 'Password123', 'szymon@email.com', '2020-04-28', 'Szymon', 'Nowak', 123123123, '1999-07-11', 4, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`);

--
-- Indeksy dla tabeli `album_song`
--
ALTER TABLE `album_song`
  ADD PRIMARY KEY (`album_song_id`),
  ADD KEY `album_song_album_fk` (`album_id`),
  ADD KEY `album_song_song_fk` (`song_id`);

--
-- Indeksy dla tabeli `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `artist_country_fk` (`country_id`);

--
-- Indeksy dla tabeli `artist_album`
--
ALTER TABLE `artist_album`
  ADD PRIMARY KEY (`artist_album_id`),
  ADD KEY `artist_album_artist_fk` (`artist_id`),
  ADD KEY `artist_album_album_fk` (`album_id`);

--
-- Indeksy dla tabeli `artist_song`
--
ALTER TABLE `artist_song`
  ADD PRIMARY KEY (`artist_song_id`),
  ADD KEY `artist_song_artist_fk` (`artist_id`),
  ADD KEY `artist_song_song_fk` (`song_id`);

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indeksy dla tabeli `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indeksy dla tabeli `liked_albums`
--
ALTER TABLE `liked_albums`
  ADD PRIMARY KEY (`liked_albums_id`),
  ADD KEY `liked_albums_user_fk` (`user_id`) USING BTREE,
  ADD KEY `liked_albums_album_fk` (`album_id`) USING BTREE;

--
-- Indeksy dla tabeli `liked_artists`
--
ALTER TABLE `liked_artists`
  ADD PRIMARY KEY (`liked_artists_id`),
  ADD KEY `liked_artists_user_fk` (`user_id`) USING BTREE,
  ADD KEY `liked_artists_artist_fk` (`artist_id`) USING BTREE;

--
-- Indeksy dla tabeli `liked_songs`
--
ALTER TABLE `liked_songs`
  ADD PRIMARY KEY (`liked_songs_id`),
  ADD KEY `liked_songs_user_fk` (`user_id`),
  ADD KEY `liked_songs_song_fk` (`song_id`);

--
-- Indeksy dla tabeli `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`playlist_id`),
  ADD KEY `playlist_user_fk` (`user_id`);

--
-- Indeksy dla tabeli `playlist_song`
--
ALTER TABLE `playlist_song`
  ADD PRIMARY KEY (`playlist_song_id`),
  ADD KEY `playlist_song_playlist_fk` (`playlist_id`),
  ADD KEY `playlist_song_song_fk` (`song_id`);

--
-- Indeksy dla tabeli `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`song_id`);

--
-- Indeksy dla tabeli `szpotify_user`
--
ALTER TABLE `szpotify_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_country_fk` (`country_id`),
  ADD KEY `user_gender_fk` (`gender_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `album_song`
--
ALTER TABLE `album_song`
  MODIFY `album_song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `artist_album`
--
ALTER TABLE `artist_album`
  MODIFY `artist_album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `artist_song`
--
ALTER TABLE `artist_song`
  MODIFY `artist_song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT dla tabeli `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `liked_albums`
--
ALTER TABLE `liked_albums`
  MODIFY `liked_albums_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `liked_artists`
--
ALTER TABLE `liked_artists`
  MODIFY `liked_artists_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `liked_songs`
--
ALTER TABLE `liked_songs`
  MODIFY `liked_songs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `playlist`
--
ALTER TABLE `playlist`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `playlist_song`
--
ALTER TABLE `playlist_song`
  MODIFY `playlist_song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `song`
--
ALTER TABLE `song`
  MODIFY `song_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT dla tabeli `szpotify_user`
--
ALTER TABLE `szpotify_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `album_song`
--
ALTER TABLE `album_song`
  ADD CONSTRAINT `album_song_album_fk` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  ADD CONSTRAINT `album_song_song_fk` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`);

--
-- Ograniczenia dla tabeli `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `artist_country_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Ograniczenia dla tabeli `artist_album`
--
ALTER TABLE `artist_album`
  ADD CONSTRAINT `artist_album_album_fk` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  ADD CONSTRAINT `artist_album_artist_fk` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`);

--
-- Ograniczenia dla tabeli `artist_song`
--
ALTER TABLE `artist_song`
  ADD CONSTRAINT `artist_song_artist_fk` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `artist_song_song_fk` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`);

--
-- Ograniczenia dla tabeli `liked_albums`
--
ALTER TABLE `liked_albums`
  ADD CONSTRAINT `albums_album_fk` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  ADD CONSTRAINT `albums_user_fk` FOREIGN KEY (`user_id`) REFERENCES `szpotify_user` (`user_id`);

--
-- Ograniczenia dla tabeli `liked_artists`
--
ALTER TABLE `liked_artists`
  ADD CONSTRAINT `artists_artist_fk` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `artists_user_fk` FOREIGN KEY (`user_id`) REFERENCES `szpotify_user` (`user_id`);

--
-- Ograniczenia dla tabeli `liked_songs`
--
ALTER TABLE `liked_songs`
  ADD CONSTRAINT `liked_songs_song_fk` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`),
  ADD CONSTRAINT `liked_songs_user_fk` FOREIGN KEY (`user_id`) REFERENCES `szpotify_user` (`user_id`);

--
-- Ograniczenia dla tabeli `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_user_fk` FOREIGN KEY (`user_id`) REFERENCES `szpotify_user` (`user_id`);

--
-- Ograniczenia dla tabeli `playlist_song`
--
ALTER TABLE `playlist_song`
  ADD CONSTRAINT `playlist_song_playlist_fk` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  ADD CONSTRAINT `playlist_song_song_fk` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`);

--
-- Ograniczenia dla tabeli `szpotify_user`
--
ALTER TABLE `szpotify_user`
  ADD CONSTRAINT `user_country_fk` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  ADD CONSTRAINT `user_gender_fk` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
