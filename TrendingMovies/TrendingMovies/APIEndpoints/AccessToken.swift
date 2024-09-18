//
//  AccessToken.swift
//  TrendingMovies
//
//  Created by Manish Gupta on 9/18/24.
//

import Foundation
import FirebaseRemoteConfig

final class AccessToken {
    private var retryCount = 2
    private var remoteConfig = RemoteConfig.remoteConfig()
    var accessToken: String = ""
    var apiKey: String = ""

    static var instance = AccessToken()

    private init() {
        fetchTokenAndStore()

        if let accessToken = KeyChainManager.instance.retrieve(forKey: KeyChainConstants.accessToken) {
            self.accessToken = accessToken
        }
        if let apiKey = KeyChainManager.instance.retrieve(forKey: KeyChainConstants.apiKey) {
            self.apiKey = apiKey
        }
    }

    private func fetchTokenAndStore() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.fetch (completionHandler: { status, err in
            DispatchQueue.main.async {
                switch status {
                case .failure:
                    self.retry()
                case .success:
                    self.parse()
                default:
                    break
                }
            }
        })
        remoteConfig.activate()
    }
    
    // MARK: Private methods
    private func retry() {
        if retryCount > 0 {
            parse()
            retryCount -= 1
        }
    }

    private func parse() {
        let authJSON = remoteConfig.configValue(forKey: KeyChainConstants.authJSON).jsonValue as? NSDictionary
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
