import Fluent
import FluentSQLiteDriver
import Vapor
import Leaf

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}