//
//  HOFTP1View.swift
//  2026
//
//  Created by Bits on 15/10/2026.
//

import SwiftUI

struct HOFTP1View: View {
    let names = ["salma" , "sara" , "malak"]
    var body: some View {
        
        //======== MAP EXAMPLE
        HStack{
            ForEach (names.map{$0.uppercased()} , id : \.self ){
                name in Text(name)
            }
        }
        
    }
}

#Preview {
    HOFTP1View()
}
