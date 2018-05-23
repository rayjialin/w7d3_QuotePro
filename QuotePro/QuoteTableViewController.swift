//
//  QuoteTableViewController.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import UIKit
import RealmSwift

class QuoteTableViewController: UIViewController {
    
    var quoteAndImages: Results<QuoteAndImage>?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func createNewQuote(_ sender: UIBarButtonItem) {
        
        // navigate to new quote VC
        performSegue(withIdentifier: "segueToNewQuote", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let realm = try! Realm()
        quoteAndImages = realm.objects(QuoteAndImage.self)
        collectionView.reloadData()
    }
    
}

extension QuoteTableViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quoteAndImages?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quoteCellId", for: indexPath) as? QuoteCell {
            
            guard let quoteAndImages = quoteAndImages else {return cell}
            let quoteAndImage = quoteAndImages[indexPath.row]
            cell.quoteAuthorLabel.text = quoteAndImage.quoteAuthor
            cell.quoteTextLabel.text = quoteAndImage.quoteText
            
            guard let image = quoteAndImage.imageData else {return cell}
            cell.quoteImageView.image = UIImage(data: image)
            
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quoteCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // navigate to selected cell to share quote
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let quoteAndImages = quoteAndImages else {return}
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else {return}
        let quoteAndImage = quoteAndImages[indexPath.row]
        let destinationController = segue.destination as? DetailViewController
        destinationController?.quoteAndImage = quoteAndImage
    }
    
}

