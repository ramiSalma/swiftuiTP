//
//  ProductService.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import Foundation

struct ProductResponse: Decodable {
    let products: [Product]
}

struct ProductService {
    
    func fetchProducts() async throws -> [Product] {
        let url = URL(
            string : "https://dummyjson.com/products"
        )!
        
        let (data , response ) = try await URLSession.shared.data(from : url)
        
        guard let httpResponse = response as? HTTPURLResponse ,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let result = try JSONDecoder().decode(
            ProductResponse.self ,
            from : data
        )
        
        return result.products
    }
    
    
    
}
