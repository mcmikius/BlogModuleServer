//
//  DeleteContentController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent

protocol DeleteContentController: IdentifiableContentController
    where Model: DeleteContentRepresentable
{
    func delete(_ req: Request) throws -> EventLoopFuture<HTTPStatus>
    func setupDeleteRoute(routes: RoutesBuilder)
}

extension DeleteContentController {

    func delete(_ req: Request) throws -> EventLoopFuture<HTTPStatus> {
        try self.find(req)
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
    func setupDeleteRoute(routes: RoutesBuilder) {
        routes.delete(self.idPathComponent, use: self.delete)
    }
}

