//
//  BlogPostEditForm.swift
//  App
//
//  Created by Mykhailo Bondarenko on 16.06.2020.
//

import Vapor

final class BlogPostEditForm: Encodable {

    var id: String? = nil
    var title = BasicFormField()
    var slug = BasicFormField()
    var excerpt = BasicFormField()
    var date = BasicFormField()
    var content = BasicFormField()
}
