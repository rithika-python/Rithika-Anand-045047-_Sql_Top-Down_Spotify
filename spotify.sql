create database spotify;
use spotify;

-- Create User Table
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    SubscriptionType VARCHAR(50),
    DateJoined DATETIME NOT NULL
);

-- Create Genre Table
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(255) NOT NULL
);

-- Create Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    GenreID INT,
    Bio TEXT,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) -- Establish relationship with Genre
);

-- Create Album Table
CREATE TABLE Album (
    AlbumID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) -- Establish relationship with Artist
);

-- Create Song Table
CREATE TABLE Song (
    SongID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Duration INT NOT NULL, -- duration in seconds
    GenreID INT,
    AlbumID INT,
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID), -- Establish relationship with Genre
    FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID) -- Establish relationship with Album
);

-- Create Playlist Table
CREATE TABLE Playlist (
    PlaylistID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    UserID INT,
    CreatedDate DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID) -- Establish relationship with User
);

-- Create Subscription Table
CREATE TABLE Subscription (
    SubscriptionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME,
    PlanType VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES User(UserID) -- Establish relationship with User
);

-- Create ListeningHistory Table
CREATE TABLE ListeningHistory (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    SongID INT,
    Timestamp DATETIME NOT NULL,
    DeviceType VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES User(UserID), -- Establish relationship with User
    FOREIGN KEY (SongID) REFERENCES Song(SongID) -- Establish relationship with Song
);

-- Create PlaylistSong Table
CREATE TABLE PlaylistSong (
    PlaylistID INT,
    SongID INT,
    PRIMARY KEY (PlaylistID, SongID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID), -- Establish relationship with Playlist
    FOREIGN KEY (SongID) REFERENCES Song(SongID) -- Establish relationship with Song
);

-- Create SongArtist Table
CREATE TABLE SongArtist (
    SongID INT,
    ArtistID INT,
    PRIMARY KEY (SongID, ArtistID),
    FOREIGN KEY (SongID) REFERENCES Song(SongID), -- Establish relationship with Song
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) -- Establish relationship with Artist
);

-- Create SongGenre Table
CREATE TABLE SongGenre (
    SongID INT,
    GenreID INT,
    PRIMARY KEY (SongID, GenreID),
    FOREIGN KEY (SongID) REFERENCES Song(SongID), -- Establish relationship with Song
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID) -- Establish relationship with Genre
);

-- Insert Data into User Table
INSERT INTO User (Username, Email, Password, SubscriptionType, DateJoined) VALUES
('Anurag Sharma', 'anurag.sharma@example.com', 'password123', 'Premium', '2024-08-01'),
('Anjali Kumari', 'anjali.kumari@example.com', 'password123', 'Free', '2024-08-01'),
('Vishal Kaushik', 'vishal.kaushik@example.com', 'password123', 'Premium', '2024-08-01'),
('Rithika Anand', 'rithika.anand@example.com', 'password123', 'Premium', '2024-08-01');

-- Insert Data into Genre Table
INSERT INTO Genre (GenreName) VALUES
('Hindi'),      -- GenreID = 1
('Punjabi'),    -- GenreID = 2
('English');     -- GenreID = 3

-- Insert Data into Artist Table
INSERT INTO Artist (Name, GenreID, Bio) VALUES
('Arijit Singh', 1, 'Popular Hindi playback singer.'),
('Diljit Dosanjh', 2, 'Famous Punjabi singer and actor.'),
('Ed Sheeran', 3, 'Renowned English singer-songwriter.'),
('Shreya Ghoshal', 1, 'Celebrated Indian playback singer.'),
('Badshah', 2, 'Popular Punjabi rapper and singer.'),
('Adele', 3, 'Award-winning English singer-songwriter.');

-- Insert Data into Album Table
INSERT INTO Album (Title, ReleaseDate, ArtistID) VALUES
('Aashiqui 2', '2013-04-26', 1),  -- Arijit Singh
('Proper Patola', '2013-08-26', 2),  -- Diljit Dosanjh
('Divide', '2017-03-03', 3),  -- Ed Sheeran
('Shreya Ghoshal: The Album', '2020-10-02', 4),  -- Shreya Ghoshal
('O.N.E.', '2021-06-30', 5),  -- Badshah
('25', '2015-11-20', 6);  -- Adele

-- Insert Data into Song Table
INSERT INTO Song (Title, Duration, GenreID, AlbumID) VALUES
('Tum Hi Ho', 261, 1, 1),  -- Arijit Singh
('Channa Mereya', 274, 1, 1),  -- Arijit Singh
('Proper Patola', 194, 2, 2),  -- Diljit Dosanjh
('Shape of You', 263, 3, 3),  -- Ed Sheeran
('Teri Mitti', 292, 1, 1),  -- B Praak
('Lover', 231, 3, 6),  -- Taylor Swift
('Kala Chashma', 180, 2, 5),  -- Badshah
('Agar Tum Saath Ho', 256, 1, 1),  -- Arijit Singh
('Bad Guy', 194, 3, 3);  -- Billie Eilish

-- Insert Data into Subscription Table
INSERT INTO Subscription (UserID, StartDate, EndDate, PlanType) VALUES
(1, '2024-08-01', '2025-08-01', 'Premium'),  -- Anurag Sharma
(2, '2024-08-01', NULL, 'Free'),               -- Anjali Kumari
(3, '2024-08-01', '2025-08-01', 'Premium'),  -- Vishal Kaushik
(4, '2024-08-01', '2025-08-01', 'Premium');  -- Rithika Anand

-- Insert Data into ListeningHistory Table
INSERT INTO ListeningHistory (UserID, SongID, Timestamp, DeviceType) VALUES
(1, 1, '2024-08-01 10:00:00', 'Mobile'),
(2, 2, '2024-08-01 10:05:00', 'Desktop'),
(3, 3, '2024-08-01 10:10:00', 'Mobile'),
(4, 4, '2024-08-01 10:15:00', 'Tablet'),
(1, 5, '2024-08-01 10:20:00', 'Desktop'),
(2, 6, '2024-08-01 10:25:00', 'Mobile');

-- Insert Data into Playlist Table
INSERT INTO Playlist (Name, UserID, CreatedDate) VALUES
('My Favorite Songs', 1, '2024-08-01'),
('Punjabi Beats', 2, '2024-08-01'),
('Chill Vibes', 3, '2024-08-01'),
('Workout Playlist', 4, '2024-08-01');

-- Insert Data into PlaylistSong Table
INSERT INTO PlaylistSong (PlaylistID, SongID) VALUES
(1, 1),  -- My Favorite Songs
(1, 3),
(1, 4),
(2, 3),  -- Punjabi Beats
(2, 6),
(3, 5),  -- Chill Vibes
(3, 2),
(4, 7);  -- Workout Playlist

-- Insert Data into SongArtist Table
INSERT INTO SongArtist (SongID, ArtistID) VALUES
(1, 1),  -- Tum Hi Ho by Arijit Singh
(2, 1),  -- Channa Mereya by Arijit Singh
(3, 2),  -- Proper Patola by Diljit Dosanjh
(4, 3),  -- Shape of You by Ed Sheeran
(5, 1),  -- Teri Mitti by B Praak
(6, 6),  -- Lover by Taylor Swift
(7, 5),  -- Kala Chashma by Badshah
(8, 1),  -- Agar Tum Saath Ho by Arijit Singh
(9, 6);  -- Bad Guy by Billie Eilish

-- Insert Data into SongGenre Table
INSERT INTO SongGenre (SongID, GenreID) VALUES
(1, 1),  -- Tum Hi Ho (Hindi)
(2, 1),  -- Channa Mereya (Hindi)
(3, 2),  -- Proper Patola (Punjabi)
(4, 3),  -- Shape of You (English)
(5, 1),  -- Teri Mitti (Hindi)
(6, 3),  -- Lover (English)
(7, 2),  -- Kala Chashma (Punjabi)
(8, 1),  -- Agar Tum Saath Ho (Hindi)
(9, 3);  -- Bad Guy (English)
