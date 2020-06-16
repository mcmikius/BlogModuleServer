//
//  ValidatableContent.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol ValidatableContent: Content, Validatable {
    
}

extension ValidatableContent {
    static func validations(_ validations: inout Validations) {}
}

