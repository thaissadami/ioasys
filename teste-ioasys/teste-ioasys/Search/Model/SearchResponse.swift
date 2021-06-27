//
//  SearchResponse.swift
//  teste-ioasys
//
//  Created by Thais Sadami on 26/06/21.
//

import Foundation

class SearchResponse: RequestModel {
    let enterprises: [Enterprise]?

    enum CodingKeys: String, CodingKey {
        case enterprises
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enterprises = try container.decodeIfPresent([Enterprise].self, forKey: .enterprises)
        
        try super.init(from: decoder)
    }

    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(enterprises, forKey: .enterprises)
        try super.encode(to: encoder)
    }
}
