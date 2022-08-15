//
//  Tweet.swift
//  TwitterSwiftUI
//
//  Created by Clifton Baggerman on 12/8/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
 
