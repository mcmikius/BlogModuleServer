//
//  IdentifiableContentController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent

protocol IdentifiableContentController: ContentController {

    var idParamKey: String { get }
    var idPathComponent: PathComponent { get }
    func find(_ req: Request) throws -> EventLoopFuture<Model>
}

extension IdentifiableContentController {

    var idParamKey: String { "id" }
    var idPathComponent: PathComponent { .init(stringLiteral: ":" + self.idParamKey) }
}

extension IdentifiableContentController where Model.IDValue == UUID {

    func find(_ req: Request) throws -> EventLoopFuture<Model> {
        guard
            let rawValue = req.parameters.get(self.idParamKey),
            let id = UUID(uuidString: rawValue)
        else {
            throw Abort(.badRequest)
        }
        return Model.find(id, on: req.db).unwrap(or: Abort(.notFound))
    }
}
