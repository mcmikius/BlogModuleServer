//
//  CreateContentRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol CreateContentRepresentable: GetContentRepresentable {
    associatedtype CreateContent: ValidatableContent

    func create(_: CreateContent) throws
}

extension CreateContentRepresentable {
    func create(_: CreateContent) throws {}
}
