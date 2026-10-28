//
//  Product.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let thumbnail: String
}



