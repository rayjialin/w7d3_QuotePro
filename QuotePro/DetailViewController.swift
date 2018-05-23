//
//  DetailViewController.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteLinkLabel: UILabel!
    @IBOutlet weak var quoteImage: UIImageView!
    
    // instantiate another object to take in the object passed from collection view
    var quoteAndImage = QuoteAndImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Share", style: .plain, target: self, action: #selector(shareQuote))
        
        authorLabel.text = quoteAndImage.quoteAuthor
        quoteLabel.text = quoteAndImage.quoteText
        quoteLinkLabel.text = quoteAndImage.quoteLink
        
        guard let image = quoteAndImage.imageData else {return}
        quoteImage.image = UIImage(data: image)
        
    }
    
    @objc func shareQuote(){
        let image = TakeSnapShot()
        
        guard let jpegData = UIImageJPEGRepresentation(image, 1.0) else {return}
        let activityVC = UIActivityViewController(activityItems: [jpegData], applicationActivities: [])
        present(activityVC, animated: true, completion: nil)
    }
    
    func TakeSnapShot() -> UIImage{
        // take a snapshot of the quote with background image
        var image = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        guard let CGimage = UIGraphicsGetCurrentContext()?.makeImage() else {return image}
        UIGraphicsEndImageContext()
        
        image = UIImage(cgImage: CGimage)
        return image
        
    }
    
    
}
