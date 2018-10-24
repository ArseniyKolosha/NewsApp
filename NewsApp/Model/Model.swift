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
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2018-09-23&sortBy=publishedAt&apiKey=354d804260494f41a9bc8e180647219c")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile , responce, error) in
        if urlFile != nil {
          
           try? FileManager.default.copyItem(at:  urlFile!, to: urlToData)
            completionHandler?()
        }
    }
    downloadTask.resume()
}



