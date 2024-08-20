# Spotify Database Project

This repository contains the SQL schema and data for a Spotify-like music streaming platform. The project follows a top-bottom approach, designed to represent various aspects of Spotify's data architecture, including users, artists, albums, songs, playlists, subscriptions, and listening history.

## Project Overview

In this project, we have created a relational database to model Spotify's functionality. The database is designed to store and manage information about users, music genres, artists, albums, songs, playlists, and the relationships between these entities.

### Key Features:
- **User Management:** Store information about users, including their subscription types and listening history.
- **Music Catalog:** Organize songs by genres, albums, and artists.
- **Playlists:** Allow users to create and manage playlists.
- **Subscription Plans:** Track user subscriptions and plan details.
- **Listening History:** Record the songs listened to by users, along with timestamps and device types.

## Database Schema

The database schema is designed using a top-down approach, ensuring that each component is well-integrated and normalized to minimize redundancy and ensure data integrity.

### Tables:

- **User:** Stores user details such as username, email, password, subscription type, and date joined.
- **Genre:** Contains music genres (e.g., Hindi, Punjabi, English).
- **Artist:** Stores artist information, linked to the genres they perform in.
- **Album:** Contains information about albums, including the artist and release date.
- **Song:** Stores song details, including title, duration, genre, and album.
- **Playlist:** Manages user-created playlists.
- **Subscription:** Tracks user subscriptions, including start and end dates.
- **ListeningHistory:** Records the history of songs listened to by users.
- **PlaylistSong:** Many-to-many relationship between playlists and songs.
- **SongArtist:** Many-to-many relationship between songs and artists.
- **SongGenre:** Many-to-many relationship between songs and genres.

