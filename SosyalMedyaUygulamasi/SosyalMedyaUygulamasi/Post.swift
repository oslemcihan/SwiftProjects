//
//  Post.swift
//  SosyalMedyaUygulamasi
//
//  Created by Özlem CİHAN on 20.08.2025.
//

import Foundation

class Post {
    var email : String
    var yorum : String
    var gorselUrl : String
    
    init(email: String, yorum: String, gorselUrl: String) {
        self.email = email
        self.yorum = yorum
        self.gorselUrl = gorselUrl
    }
    
}
