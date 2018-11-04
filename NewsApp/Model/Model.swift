//
//  Model.swift
//  NewsApp
//
//  Created by Ars on 10/23/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//

import Foundation

var articles: [Article] {
    let data = try? Data(contentsOf: urlToData)
    if data == nil {
        return []
    }
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, Any>
    if rootDictionaryAny == nil {
        return []
    }
    
    let rootDictionary = rootDictionaryAny as? Dictionary<String, Any>
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String, Any>]{
        var returnArray: [Article] = []
        for dict in array {
            let  newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
        }
        return returnArray
    }
    
    return []
}


var  urlToData: URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}


func loadNews(completionHandler: (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ua&apiKey=b746c60440f4491cb8c8094903c64e75")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile , responce, error) in
        if urlFile != nil {
          
           try? FileManager.default.copyItem(at:  urlFile!, to: urlToData)
            completionHandler?()
        }
    }
    downloadTask.resume()
}



