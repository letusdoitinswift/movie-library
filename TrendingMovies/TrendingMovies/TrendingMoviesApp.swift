//
//  TrendingMoviesApp.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/16/24.
//

import SwiftUI
import FirebaseRemoteConfig
import FirebaseCore


///  We are using Firebase here to fetch the API Key and storing it on to the KeyChain.
///  Since firebase needs to be instantiated at the very beginning hence we need
///  to add the didFinishLaunchingWithOptions Appdelegate Method here.
class AppDelegate: NSObject, UIApplicationDelegate {

    // MARK: Properties
    private var remoteConfig: RemoteConfig?
    private static var retryCount = 2

    // MARK: Launch Method
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig?.configSettings = settings
        remoteConfig?.fetch { status, err in
            switch status {
            case .failure:
                self.retry()
            case .success:
                self.parse()
            default:
                break
            }
        }
        
        return true
    }
    
    // MARK: Private methods
    private func retry() {
        if Self.retryCount > 0 {
            parse()
            Self.retryCount -= 1
        }
    }

    private func parse() {
        let authJSON = remoteConfig?.configValue(forKey: KeyChainConstants.authJSON).jsonValue as? NSDictionary
        if let apiKey = authJSON?.value(forKey: KeyChainConstants.apiKey) as? String {
            let didSaveAPIKey = KeyChainManager.instance.store(value: apiKey, forKey: KeyChainConstants.apiKey)
            if !didSaveAPIKey {
                retry()
            }
        }
        if let accessToken = authJSON?.value(forKey: KeyChainConstants.accessToken) as? String {
            let didSaveAccessToken = KeyChainManager.instance.store(value: accessToken, forKey: KeyChainConstants.accessToken)
            if !didSaveAccessToken {
                retry()
            }
        }
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
