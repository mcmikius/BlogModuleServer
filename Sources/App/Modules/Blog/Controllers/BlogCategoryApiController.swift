//
//  BlogCategoryApiController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent

struct BlogCategoryApiController:
    ListContentController,
    GetContentController,
    CreateContentController,
    UpdateContentController,
    PatchContentController,
    DeleteContentController
{
    typealias Model = BlogCategoryModel
    
    func get(_ req: Request) throws -> EventLoopFuture<BlogCategoryModel.GetContent> {
        return try self.find(req).flatMap { category in
            return BlogPostModel.query(on: req.db)
                .filter(\.$category.$id == category.id!)
                .all()
                .map { posts in
                    var details = category.getContent
                    details.posts = posts.map(\.listContent)
                    return details
                }
        }
    }
}
