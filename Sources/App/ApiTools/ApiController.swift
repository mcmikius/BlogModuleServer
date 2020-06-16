//
//  ApiController.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol ApiController:
    ListContentController,
    GetContentController,
    CreateContentController,
    UpdateContentController,
    PatchContentController,
    DeleteContentController
{
    func setupRoutes(routes: RoutesBuilder, on pathComponent: PathComponent)
}

extension ApiController {

    func setupRoutes(routes: RoutesBuilder, on pathComponent: PathComponent) {
        let modelRoutes = routes.grouped(pathComponent)
        self.setupListRoute(routes: modelRoutes)
        self.setupGetRoute(routes: modelRoutes)
        self.setupCreateRoute(routes: modelRoutes)
        self.setupUpdateRoute(routes: modelRoutes)
        self.setupPatchRoute(routes: modelRoutes)
        self.setupDeleteRoute(routes: modelRoutes)
    }
}
