//
//  AdminRouter.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor

struct AdminRouter: RouteCollection {

    let controller = AdminController()

    func boot(routes: RoutesBuilder) throws {

        routes.grouped(UserModelSessionAuthenticator())
            .get("admin", use: self.controller.homeView)
    }
}
