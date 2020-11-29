# Night Drive
_______________

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)


## Overview
### Description
Allows users to create their own night driving route with music of their choice.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Entertainment / Navigation
- **Mobile:** Gives the user their own maping system.
- **Story:** User can select time to drive and a route will be produced for it. Can select a music choice to reflect their mood.
- **Market:** People who enjoy driving at night and want a quick route choosing method.
- **Habit:** Used at least once a week to help with their night drive needs. 
- **Scope:** V1 would make a route based off of a selected time and give options for a music selection.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

[/ ]User logs in to access their location and preference settings
* User picks what their favorite artist/genre/etc. (Think Spotify interface)
* User picks their route and amount of time.
* Settings (Accesibility, Notification, General, etc.)

**Optional Nice-to-have Stories**

* Log of past songs with album art covers matching
* Log of previous routes
* Page of most played songs
* Page of most driven routes
* Optional Shuffle Button (i.e. random encounter/random song)

### 2. Screen Archetypes

* Login
* Register - User signs up or logs into their account and spotify account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information and their spotify playlist
* Song/Playlist Selection Screen.
   * Allows user to be able to choose their desired song, artist, genre of preference and begin listening.
* Settings Screen
   * Lets people change language, app notification settings, set home location, and select default musical playlist.
* Home Screen
   * Allow users to select between different screens and displays some user information

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Music selection
* Location selection
* Settings

Optional:
* Discover popular routes
* Listen to popular playlist

**Flow Navigation** (Screen to Screen)
* Forced Log-in -> Account creation if no log in is available
* Music Selection -> Jumps to playlist
* Location Selection -> Jumps to map
* Settings -> Toggle settings
## Wireframes

![](https://i.imgur.com/4W0l4i7.jpg)
<img src= 'http://g.recordit.co/4q6FjtiQAM.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Schema 
### Models
#### Music

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | album      | album object   | The album on which the track appears. |
   | artists        | artist objectsr| The artists who performed the track.  |
   | duration_ms         | 	integer    | 	The track length in milliseconds. |
   | name       | String   | 	The name of the track. |
   | track_number | 	integer   | 	The number of the track.  |
   | images    | 	an array of image objects   | Images for the playlist. |
   | owner     | 	a public user object | The user who owns the playlist |
   | tracks    | 	array of playlist track objects | Information about the tracks of the playlist. |
### Networking
#### List of network requests by screen
   - Create Account Screen
      - (Create) Create a new account
   - Login screen
       - Create User account
   - Map Screen
      - (GET) Location of user
      - (GET) Time of route
      - (Create) Create a new route based off of time
      - (Delete) Clear current route
   - Select Music screen
      - (GET) Spotify information
#### [OPTIONAL:] Existing API Endpoints
##### Spotify API
- Base URL - [https://api.spotify.com](https://api.spotify.com)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | 	/v1/playlists/{playlist_id} | Retrieves 	playlist
    `GET`    | 	/v1/users/{user_id}/playlists | Get a List of a User's Playlists
    `Post`    | 	/v1/users/{user_id}/playlists   | 		Create a Playlist
    `POST`    | 	/v1/playlists/{playlist_id}/tracks | 	Add Items to a Playlist |
    |`GET` | 	/v1/playlists/{playlist_id}/tracks | Get a Playlist's tracks
