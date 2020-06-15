//
//  BlogRouter.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor

struct BlogRouter: RouteCollection {
    
    let frontendController = BlogFrontendController()
        let adminController = BlogPostAdminController()
        
        func boot(routes: RoutesBuilder) throws {
    
            routes.get("blog", use: self.frontendController.blogView)
            routes.get(.anything, use: self.frontendController.postView)
    
            routes.grouped([
                UserModelSessionAuthenticator(),
                // UserModel.guardMiddleware(),
                UserModel.redirectMiddleware(path: "/")
            ])
            .grouped("admin", "blog")
            .get("posts", use: self.adminController.listView)
    
        }
}
