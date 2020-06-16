//
//  UpdateContentController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent

protocol UpdateContentController: IdentifiableContentController
    where Model: UpdateContentRepresentable
{
    func update(_ req: Request) throws -> EventLoopFuture<Model.GetContent>
    func setupUpdateRoute(routes: RoutesBuilder)
}

extension UpdateContentController {
    
    func update(_ req: Request) throws -> EventLoopFuture<Model.GetContent> {
        try Model.UpdateContent.validate(req)
        let input = try req.content.decode(Model.UpdateContent.self)
        return try self.find(req)
        .flatMapThrowing { model -> Model in
            try model.update(input)
            return model
        }
        .flatMap { model -> EventLoopFuture<Model.GetContent> in
             return model.update(on: req.db)
                .transform(to: model.getContent)
        }
    }
    
    func setupUpdateRoute(routes: RoutesBuilder) {
        routes.put(self.idPathComponent, use: self.update)
    }
}
