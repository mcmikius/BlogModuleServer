//
//  Context.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Foundation

struct ListContext<T: Encodable>: Encodable {
    let list: [T]

    init(_ list: [T]) {
        self.list = list
    }
}

struct EditContext<T: Encodable>: Encodable {
    let edit: T
    
    init(_ edit: T) {
        self.edit = edit
    }
}
