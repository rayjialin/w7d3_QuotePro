//
//  QuoteCell.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import UIKit

class QuoteCell: UICollectionViewCell {
    
    let quoteAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let quoteTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let quoteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        [quoteImageView, quoteTextLabel, quoteAuthorLabel].forEach { addSubview($0)}
        
        quoteImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        quoteImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        quoteImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        quoteImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        quoteAuthorLabel.leadingAnchor.constraint(equalTo: quoteImageView.trailingAnchor, constant: 10).isActive = true
        quoteAuthorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        quoteAuthorLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        quoteAuthorLabel.topAnchor.constraint(equalTo: quoteImageView.topAnchor).isActive = true
        
        quoteTextLabel.leadingAnchor.constraint(equalTo: quoteImageView.trailingAnchor, constant: 10).isActive = true
        quoteTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        quoteTextLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        quoteTextLabel.topAnchor.constraint(equalTo: quoteAuthorLabel.bottomAnchor).isActive = true
    }
    
}
