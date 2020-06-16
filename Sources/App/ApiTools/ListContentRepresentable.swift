//
//  ListContentRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol ListContentRepresentable {
    associatedtype ListItem: Content

    var listContent: ListItem { get }
}
