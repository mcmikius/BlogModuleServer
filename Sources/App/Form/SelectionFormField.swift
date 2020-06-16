//
//  SelectionFormField.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Foundation

struct SelectionFormField: Encodable {
    var value: String = ""
    var error: String? = nil
    var options: [FormFieldOption] = []
}
