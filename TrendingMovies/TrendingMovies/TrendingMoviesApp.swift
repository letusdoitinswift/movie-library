//
//  TrendingMoviesApp.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/16/24.
//

import SwiftUI
import FirebaseCore

///  We are using Firebase here to fetch the API Key and storing it on to the KeyChain.
///  Since firebase needs to be instantiated at the very beginning hence we need
///  to add the didFinishLaunchingWithOptions Appdelegate Method here.
class AppDelegate: NSObject, UIApplicationDelegate {
    // MARK: Launch Method
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct TrendingMoviesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
