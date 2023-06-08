//
//  CourseStorage.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import Foundation


struct CourseStorage {
    
    func load() -> Course {
        let url = Bundle.main.url(forResource: "course", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        return try! jsonDecoder.decode(Course.self, from: data)
        
    }
    
    
}
