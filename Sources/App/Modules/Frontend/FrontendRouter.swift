//
//  FrontendRouter.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor

struct FrontendRouter: RouteCollection {
    
    let controller = FrontendController()
    
    func boot(routes: RoutesBuilder) throws {
        routes.grouped(UserModelSessionAuthenticator())
            .get(use: self.controller.homeView)
    }
}
