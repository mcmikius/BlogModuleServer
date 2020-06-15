//
//  BlogPostAdminController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

struct BlogPostAdminController {
    
    func listView(req: Request) throws -> EventLoopFuture<View> {
        struct Context<T: Encodable>: Encodable {
            let list: [T]
        }
        return BlogPostModel.query(on: req.db)
            .all()
            .mapEach(\.viewContext)
            .flatMap {
                req.view.render("Blog/Admin/Posts/List", Context(list: $0))
            }
    }
}
