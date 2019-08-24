//
//  Exercise.swift
//  YourPersonTrainer
//
//  Created by Pavel Procenko on 20/08/2019.
//  Copyright © 2019 Pavel Procenko. All rights reserved.
//

import Foundation

class Exercise: NSCopying, Decodable {
    
    let name: String
    let picture: String
    let description: String
    
    init(name: String, picture: String, description: String = "description about your exercise") {
        
        self.name = name
        self.picture = picture
        self.description = description
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Exercise(name: name, picture: picture)
    }
    
    
    
}
