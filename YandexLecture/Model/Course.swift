//
//  Course.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import Foundation

struct Course: Codable {
    var name: String
    var lectures: [Lecture]
}
