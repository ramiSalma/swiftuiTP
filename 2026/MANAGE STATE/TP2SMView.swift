//
//  TP2SMView.swift
//  2026
//
//  Created by Bits on 21/10/2026.
//

import SwiftUI

struct TP2SMView: View {
    
    @State private var username = ""
    
    var body: some View {
        VStack(alignment : .leading  ){
            
            TextField("Enter your name", text: $username)
                .textFieldStyle(.roundedBorder)
                
            Text("Hello , \(username)")
        }.padding(15)
    }
}

#Preview {
    TP2SMView()
}
