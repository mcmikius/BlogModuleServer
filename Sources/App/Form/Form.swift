//
//  Form.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent

protocol Form: Encodable {
    associatedtype Model: Fluent.Model

    var id: String? { get set }
    
    init()
    init(req: Request) throws
    
    func write(to: Model)
    func read(from: Model)
    func validate(req: Request) -> EventLoopFuture<Bool>
}
