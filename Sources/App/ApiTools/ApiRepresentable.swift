//
//  ApiRepresentable.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

protocol ApiRepresentable: ListContentRepresentable,
    CreateContentRepresentable,
    UpdateContentRepresentable,
    PatchContentRepresentable,
    DeleteContentRepresentable
{}
