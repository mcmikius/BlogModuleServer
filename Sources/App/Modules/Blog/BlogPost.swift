//
//  BlogPost.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Foundation

struct BlogPost: Encodable {
    let title: String
    let slug: String
    let image: String
    let excerpt: String
    let date: String
    let category: String?
    let content: String
}
