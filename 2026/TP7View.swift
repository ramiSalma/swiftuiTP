//
//  TP7View.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import SwiftUI

struct TP7View: View {
    
    let fruits = [
        "Apple" , "Banana" , "Orange" , "Pineapple" , "Strawberry"
    ]
    
    let columns = [
        GridItem (.flexible()) ,
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView{
            
            Text("Lazy grid in swif")
            .bold()
            .font(.title)
            .foregroundStyle(.purple)
            
            LazyVGrid(columns : columns , spacing : 10){
                ForEach(fruits ,id : \.self){
                    fruit in Text(fruit)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.blue.opacity(0.2))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                }
            }
            
            
        }.padding()
        
       
    }
}

#Preview {
    TP7View()
}
