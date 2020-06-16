//
//  Module.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

protocol Module {

    static var name: String { get }
    var name: String { get }
    
    static var path: String { get }
    var path: String { get }
    
    var router: RouteCollection? { get }
    var migrations: [Migration] { get }
    var commandGroup: CommandGroup? { get }
    
    func configure(_ app: Application) throws
}

extension Module {

    var name: String { Self.name }

    static var path: String { Self.name + "/" }
    var path: String { Self.path }

    var router: RouteCollection? { nil }
    var migrations: [Migration] { [] }
    var commandGroup: CommandGroup? { nil }
    
    func configure(_ app: Application) throws {
        for migration in self.migrations {
            app.migrations.add(migration)
        }
        if let router = self.router {
            try router.boot(routes: app.routes)
        }
        if let commandGroup = self.commandGroup {
            app.commands.use(commandGroup, as: self.name)
        }
    }
}
