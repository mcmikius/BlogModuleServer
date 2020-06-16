//
//  BlogMigration_v1_1_0.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Fluent

struct BlogMigration_v1_1_0: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema(BlogPostModel.schema)
            .field(BlogPostModel.FieldKeys.imageKey, .string)
            .update()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema(BlogPostModel.schema)
            .deleteField(BlogPostModel.FieldKeys.imageKey)
            .update()
    }
}
