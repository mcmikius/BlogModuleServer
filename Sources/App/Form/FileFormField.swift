//
//  FileFormField.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Foundation

struct FileFormField: Encodable {
    var value: String = ""
    var error: String? = nil
    var data: Data? = nil
    var delete: Bool = false
}
