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
    case postTweetUrl = "https://api.twitter.com/1.1/statuses/update.json"
    case likeTweetUrl = "https://api.twitter.com/1.1/favorites/create.json"
    case unlikeTweetUrl = "https://api.twitter.com/1.1/favorites/destroy.json"
    case retweetUrl = "https://api.twitter.com/1.1/statuses/retweet/:id.json"
    case unretweetUrl = "https://api.twitter.com/1.1/statuses/unretweet/:id.json"
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
