//
//  Model.swift
//  NewsApp
//
//  Created by Ars on 10/23/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//

import Foundation

//https://newsapi.org/v2/everything?q=bitcoin&from=2018-09-23&sortBy=publishedAt&apiKey=354d804260494f41a9bc8e180647219c

var articles: [Article] = []
func loadNews() {
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2018-09-23&sortBy=publishedAt&apiKey=354d804260494f41a9bc8e180647219c")
    let session = URLSession(configuration: .default)
    let downloadTask = session.downloadTask(with: url!) { (urlFile , responce, error) in
        if urlFile != nil {
           let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0] + "/data.json"
            let urlPath = URL(fileURLWithPath: path)
           try? FileManager.default.copyItem(at:  urlFile!, to: urlPath)
            print(urlPath)
        }
    }
    downloadTask.resume()
}
