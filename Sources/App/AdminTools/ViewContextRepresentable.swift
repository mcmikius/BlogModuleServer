//
//  ViewContextRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Foundation

public protocol ViewContextRepresentable {
    associatedtype ViewContext: Encodable

    var viewContext: ViewContext { get }
    var viewIdentifier: String { get }
}
