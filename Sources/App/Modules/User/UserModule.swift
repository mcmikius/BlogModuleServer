//
//  UserModule.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

struct UserModule: Module {
    
    var router: RouteCollection? { UserRouter() }
    
    var migrations: [Migration] {
        [
            UserMigration_v1_0_0(),
        ]
    }
}
