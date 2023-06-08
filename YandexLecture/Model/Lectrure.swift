//
//  Lectrure.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import Foundation

struct Lecture: Codable {
    var name: String
    var description: String
    var date: Date
    var urlYoutube: String
    var avatar: String?
    var position: String?
    var namePosition: String?
}
