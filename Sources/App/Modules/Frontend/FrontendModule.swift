//
//  FrontendModule.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

struct FrontendModule: Module {
    
    static var name: String = "frontend"
    
    var router: RouteCollection? { FrontendRouter() }
}
