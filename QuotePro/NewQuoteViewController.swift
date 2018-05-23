//
//  ViewController.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import UIKit
import RealmSwift

class NewQuoteViewController: UIViewController {
    
    var quoteStruct = QuoteStruct()
    var imageStruct = ImageStruct()
    
    @IBOutlet weak var backroundImage: UIImageView!
    @IBOutlet weak var quote: UILabel!
    
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        quote.numberOfLines = 0
        
        getNewQuote()
        getNewImage()
    }
    
    @IBAction func newQuote(_ sender: UIButton) {
        getNewQuote()
    }
    
    @IBAction func newImage(_ sender: UIButton) {
        getNewImage()
    }
    
    @IBAction func save(_ sender: UIButton) {
        let quoteAndImage = QuoteAndImage()
        
        quoteAndImage.quoteAuthor = quoteStruct.quoteAuthor
        quoteAndImage.quoteText = quoteStruct.quoteText
        quoteAndImage.quoteLink = quoteStruct.quoteLink
        quoteAndImage.senderLink = quoteStruct.senderLink
        quoteAndImage.senderName = quoteStruct.senderName
        quoteAndImage.imageData = imageStruct.data
        
        let realm = try! Realm()
        // Persist your data easily
        try! realm.write {
            realm.add(quoteAndImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func getNewQuote(){
        let endPoint = "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json"
        
        apiManager.getQuote(endPoint: endPoint) { (data, error) -> (Void) in
            // convert data and map to quote text field
            guard let data = data else {return}
            let decoder = JSONDecoder()
            
            
            do {
                let quoteJson = try decoder.decode(QuoteStruct.self, from: data)
                self.quoteStruct = quoteJson
                
                DispatchQueue.main.async {
                    self.quote.text = quoteJson.quoteText
                }
            }catch{
                print("error")
            }
            
        }
    }
    
    func getNewImage(){
        let endPoint = "https://lorempixel.com/400/400/"
        
        apiManager.getQuote(endPoint: endPoint) { (data, error) -> (Void) in
            guard let data = data else {return}
            
            self.imageStruct.data = data
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.backroundImage.image = image
            }
        }
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

