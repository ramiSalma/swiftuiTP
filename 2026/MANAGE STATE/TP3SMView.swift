//
//  TP3SMView.swift
//  2026
//
//  Created by Bits on 21/10/2026.
//

import SwiftUI

struct TP3SMView: View {
    @State private var password = ""
    @State private var isPasswordVisible = false
    var body: some View {
        Text("Hello, World!")
        
        VStack{
            if isPasswordVisible {
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                
            }else {
                SecureField("password" , text : $password)
                
            }
            
            Button(isPasswordVisible ? "Hide Password" : "Show password"){
                isPasswordVisible.toggle()
            }
        }.padding(20)
    }
}

#Preview {
    TP3SMView()
}
