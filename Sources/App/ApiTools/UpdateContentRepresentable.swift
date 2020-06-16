//
//  UpdateContentRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol UpdateContentRepresentable: GetContentRepresentable {
    associatedtype UpdateContent: ValidatableContent
    func update(_: UpdateContent) throws
}

extension UpdateContentRepresentable {
    func update(_: UpdateContent) throws {}
}

