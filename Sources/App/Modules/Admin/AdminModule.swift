//
//  AdminModule.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

struct AdminModule: Module {
    
    static var name: String = "admin"

    var router: RouteCollection? { AdminRouter() }
}
