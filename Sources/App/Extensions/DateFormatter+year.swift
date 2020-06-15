//
//  DateFormatter+year.swift
//  App
//
//  Created by Mykhailo Bondarenko on 15.06.2020.
//

import Foundation

extension DateFormatter {

    static var year: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "y"
        return formatter
    }()
}
