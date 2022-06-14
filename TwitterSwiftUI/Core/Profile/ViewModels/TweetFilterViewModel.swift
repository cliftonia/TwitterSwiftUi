//
//  TweetFilterViewModel.swift
//  TwitterSwiftUI
//
//  Created by Clifton Theodore on 14/6/2022.
//

import Foundation

enum TwitterFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case.likes: return "Likes"
        }
    }
}
