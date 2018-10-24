//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by Ars on 10/23/18.
//  Copyright © 2018 ArsenIT. All rights reserved.
//

import UIKit
import  SafariServices

class OneNewsViewController: UIViewController {

    var article: Article!
    var index: Int = 0
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var openSafariOutlet: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

       titleLabel.text = article.title
       textView.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                   self.imageView.image = UIImage(data: data)
                }
                self.activityIndicator.isHidden = true
            }
        }
        
        if URL(string: article.url) == nil {
            openSafariOutlet.isEnabled = true
        }
        
    }
    
    @IBAction func pushOpenAction(_ sender: UIButton) {
        if let url =  URL(string: article.url) {
            let svc = SFSafariViewController(url: url)
            present(svc, animated: true, completion: nil)
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
