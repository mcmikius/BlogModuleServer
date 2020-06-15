//
//  AdminController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor

struct AdminController {
    
    func homeView(req: Request) throws -> EventLoopFuture<View> {
        let user = try req.auth.require(UserModel.self)

        struct Context: Encodable {
            let title: String
            let header: String
            let message: String
        }
        let context = Context(title: "myPage - Admin",
                              header: "Hi \(user.email)",
                              message: "welcome to the CMS!")
        return req.view.render("Admin/Home", context)
    }
}
