//
//  StructModel.swift
//  QuotePro
//
//  Created by ruijia lin on 5/22/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

import Foundation

struct QuoteStruct: Codable {
    var quoteAuthor: String?
    var quoteLink: String?
    var quoteText: String?
    var senderLink: String?
    var senderName: String?
}


struct ImageStruct: Codable {
    var data: Data?
}
