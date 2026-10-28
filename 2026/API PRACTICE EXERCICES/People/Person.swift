//
//  Person.swift
//  2026
//
//  Created by Bits on 27/10/2026.
//

import Foundation

struct Person : Identifiable , Decodable {
    
    let id : Int
    let name : String
    let email : String
    let phone : String
}
