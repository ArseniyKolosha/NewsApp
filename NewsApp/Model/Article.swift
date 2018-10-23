//
//  Article.swift
//  NewsApp
//
//  Created by Ars on 10/23/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//

import Foundation

/*
 {
 -"source": {
 "id": null,
 "name": "Forbes.com"
 },
 "author": "Darryn Pollock, Contributor, Darryn Pollock, Contributor https://www.forbes.com/sites/darrynpollock/",
 "title": "Africa's Blockchain Potential Untapped, But How To Implement It?",
 "description": "Africa has much room for a technological revolution it can lead itself. Blockchain has the potential to be that vessel, but can it be implemented correctly?",
 "url": "https://www.forbes.com/sites/darrynpollock/2018/10/23/africas-blockchain-potential-untapped-but-how-to-implement-it/",
 "urlToImage": "https://thumbor.forbes.com/thumbor/600x315/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F42543661%2F960x0.jpg%3Ffit%3Dscale",
 "publishedAt": "2018-10-23T12:27:00Z",
 "content": "Share to facebook Share to twitter Share to linkedin Janeffer Wacheke, co-owner of a fresh-vegetable stall, checks her mobile phone for a purchase order of vegetables and fruits made to Twiga Foods Ltd., while on her stall in Nairobi, Kenya, on June 11, 2018.… [+21360 chars]"
 }
 */

struct Article {
    
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var sourceName: String
    
    init(dictionary: Dictionary<String, Any>) {
        author = dictionary["author"] as? String ?? ""
        title = dictionary["title"] as? String ?? ""
        description = dictionary["description"] as? String ?? ""
        url = dictionary["url"] as? String ?? ""
        urlToImage = dictionary["urlToImage"] as? String ?? ""
        publishedAt = dictionary["publishedAt"] as? String ?? ""
        
        sourceName = (dictionary["source"] as? Dictionary<String, Any> ?? ["": ""])["name"] as? String ?? ""
        
    }
    
}
