//
//  TP7SMView.swift
//  2026
//
//  Created by Bits on 22/10/2026.
//

import SwiftUI



struct Article: Identifiable {
    let id = UUID()
    let name : String
    let price : Double
    let description : String
    let quantity : Int
    let category : String
   
}


struct TP7SMView: View {
    
    @State private var name : String = ""
    @State private var price : Double = 0.0
    @State private var description : String = ""
    @State private var quantity : Int = 0
    @State private var category : String = ""
    
    
    
    @State private var articles: [Article] = [
        Article(
           name: "T-Shirt",
           price: 120,
           description: "Cotton T-shirt",
           quantity: 10,
           category: "Clothes"
        ),
        Article(
            name: "Jeans",
            price: 250,
            description: "Blue denim jeans",
            quantity: 5,
            category: "Clothes"
        ),
        Article(
            name: "Headphones",
            price: 350,
            description: "Wireless headphones",
            quantity: 8,
            category: "Electricity"
        ),
        Article(
            name: "Laptop",
            price: 6500,
            description: "Laptop for work and study",
            quantity: 3,
            category: "Electricity"
        ),
        Article(
            name: "Milk",
            price: 8,
            description: "One liter of fresh milk",
            quantity: 20,
            category: "Food"
        ),
        Article(
            name: "Bread",
            price: 2,
            description: "Fresh bread",
            quantity: 15,
            category: "Food"
        ),
        Article(
            name: "Cleaning Spray",
            price: 35,
            description: "Household cleaning product",
            quantity: 6,
            category: "Household"
        ),
        Article(
            name: "Notebook",
            price: 15,
            description: "A4 school notebook",
            quantity: 12,
            category: "Others"
        )
    ]
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section("ADD NEW ARTICLE"){
                        
                    }
                }
                
                
                List{
                    ForEach(articles){ Article in
                        VStack(alignment : .leading){
                            Text(Article.name).font(.headline)
                            Text(Article.description).font(.subheadline)
                        }
                        
                    }
                }
            }
        }.navigationTitle("Articles Manager")
        
        
        
//        func AddArtciel(){
//            
//        }
    }
}

#Preview {
    TP7SMView()
}
