//
//  UtilityCommandGroup.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor
 
struct UtilityCommandGroup: CommandGroup {
 
    let commands: [String: AnyCommand]
    let help: String
    
    var defaultCommand: AnyCommand? {
        self.commands[UtilityFileTransferCommand.name]
    }
 
    init() {
        self.help = "Various utility tools"
 
        self.commands = [
            UtilityFileTransferCommand.name: UtilityFileTransferCommand(),
        ]
    }
}
