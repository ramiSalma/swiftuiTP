//
//  peopleService.swift
//  2026
//
//  Created by Bits on 27/10/2026.
//

import Foundation

struct PeopleService  {
    
    func fetchPeople() async throws -> [Person] {
        
        let url = URL(
            string : "https://jsonplaceholder.typicode.com/users"
        )!
        
        let (data , response) = try await URLSession.shared.data(
            from : url
        )
        
        guard let httpResponse = response as? HTTPURLResponse ,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw URLError(.badServerResponse)
        }
        
        let people = try JSONDecoder().decode(
            [Person].self ,
            from : data
        )
        
        return people
    }
}
