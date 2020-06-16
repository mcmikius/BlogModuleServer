//
//  FormFieldOption.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Foundation

struct FormFieldOption: Encodable {
    
    public let key: String
    public let label: String
    
    public init(key: String, label: String) {
        self.key = key
        self.label = label
    }
}
