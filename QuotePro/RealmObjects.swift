//
//  RealmObjects.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteAndImage: Object, Codable {
    @objc dynamic var quoteAuthor: String?
    @objc dynamic var quoteLink: String?
    @objc dynamic var quoteText: String?
    @objc dynamic var senderLink: String?
    @objc dynamic var senderName: String?
    @objc dynamic var imageData: Data?
}
