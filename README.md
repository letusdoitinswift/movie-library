# movie-library
This app retrieves and displays a list of trending movies using the TMDB API. It also shows the more information on the movie with details on Director, Actors, Genre and Ratings.

Following are the main considerations while building this app:
1. The app is built using Xcode version 15.4 and supports minimum iOS as iOS 15.
2. The app uses SwiftUI in conjunction with Swift. (no UIKit has been used)
3. Model-View-ViewModel Arch pattern has been followed.
4. Separation of concerns is maintained through out the app for each functionality.
5. The app codebase does not store API Key or AccessToken credentials. But in order to use them, Firebase has been integrated with the app.
6. The app has a specific file where Endpoints have been maintained and it is named as Endpoints.swift
7. The app is storing accessToken into the keychain upon first fetch and then keeps using from the Keychain.
8. The token has not been exposed anywhere insidet the app.
9. Errors have been handled at places where an API can fail or can throw an exception.
10. Async / Await has been used through out the app for network call.
11. Image logic for portrait mode image and large image has been used.
12. Dependency Injection principle has been followed by injecting the objects as view models into the views, so that they are readily available.
13. Single responsibility prinicilple and other SOLID priniciples have been followed. Although I did not find any need to use delegates since the combine framework already helps in emitting required values once they are observed.
14. Please feel free to comment and suggest. I could not handle caching for the images and urls. I can work on that.
