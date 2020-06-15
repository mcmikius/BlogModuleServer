//
//  BlogFrontendController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor

struct BlogFrontendController {
    
    func blogView(req: Request) throws -> EventLoopFuture<View> {
            struct Context: Encodable {
                struct PostWithCategory: Encodable {
                    var category: BlogCategoryModel.ViewContext
                    var post: BlogPostModel.ViewContext
                }
                let title: String
                let items: [PostWithCategory]
            }
    
            return BlogPostModel.query(on: req.db)
                .sort(\.$date, .descending)
                .with(\.$category)
                .all()
                .mapEach { Context.PostWithCategory(category: $0.category.viewContext,
                                                    post: $0.viewContext) }
                .flatMap {
                    let context = Context(title: "myPage - Blog", items: $0)
                    return req.view.render("blog", context)
                }
        }
    
//    func postView(req: Request) throws -> EventLoopFuture<Response> {
//        let posts = BlogRepository().publishedPosts()
//                let slug = req.url.path.trimmingCharacters(in: .init(charactersIn: "/"))
//        guard let post = posts.first(where: { $0.slug == slug }) else {
//            return req.eventLoop.future(req.redirect(to: "/"))
//        }
//        struct Context: Encodable {
//            let title: String
//            let post: BlogPost
//
//        }
//        let context = Context(title: "myPage - \(post.title)", post: post)
//        return req.view.render("post", context).encodeResponse(for: req)
//    }
}
