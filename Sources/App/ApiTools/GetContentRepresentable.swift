//
//  GetContentRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol GetContentRepresentable {
    associatedtype GetContent: Content

    var getContent: GetContent { get }
}
