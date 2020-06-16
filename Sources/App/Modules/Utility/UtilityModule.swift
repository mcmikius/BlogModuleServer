//
//  UtilityModule.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
import Fluent
 
struct UtilityModule: Module {
 
    static var name: String = "utility"
var commandGroup: CommandGroup? { UtilityCommandGroup() }
}
