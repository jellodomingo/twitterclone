//
//  Enums.swift
//  Twitter
//
//  Created by Angelo Domingo on 2/9/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import Foundation

enum Urls: String {
    case loginUrl = "https://api.twitter.com/oauth/request_token"
    case tweetUrls = "https://api.twitter.com/1.1/statuses/home_timeline.json"
}

enum SeguesIdentifier: String {
    case loginToHome
}

enum UserDefaultsKeys: String{
    case userLoggedIn
}

enum Cells: String{
    case tweetCell
}
