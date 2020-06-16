//
//  PatchContentRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol PatchContentRepresentable: GetContentRepresentable {
    associatedtype PatchContent: ValidatableContent
    func patch(_: PatchContent) throws
}

extension PatchContentRepresentable {
    func patch(_: PatchContent) throws {}
}

