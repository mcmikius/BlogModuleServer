//
//  UserModelSessionAuthenticator.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Vapor
import Fluent

struct UserModelSessionAuthenticator: SessionAuthenticator {

    typealias User = UserModel
    
    func authenticate(sessionID: User.SessionID,
                      for req: Request) -> EventLoopFuture<Void> {
        User.find(sessionID, on: req.db).map { user  in
            if let user = user {
                req.auth.login(user)
            }
        }
    }
}
