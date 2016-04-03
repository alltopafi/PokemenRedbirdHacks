//
//  pokemon.swift
//  PokemonRedbirdHacks
//
//  Created by Jesse Alltop on 4/2/16.
//  Copyright © 2016 Jesse Alltop. All rights reserved.
//

import Foundation

class pokemon:NSObject{
    
    var name:String = ""
    var caught:Bool = false
    
    init(name: String, caught: Bool)
    {
        self.name = name
        self.caught = caught
    }
    
    func getName() -> String {
        return name
    }
    
    func getCaught() -> Bool{
        return caught
    }
    
    
    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObjectForKey("name") as? String,
            let caught = decoder.decodeObjectForKey("caught") as? Bool
            else { return nil }
        
        self.init(
            name: name,
            caught: caught
        )
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name,     forKey: "name")
        aCoder.encodeObject(caught, forKey: "caught")
    }
    
    
}