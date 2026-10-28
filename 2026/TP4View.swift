//
//  TP4View.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct TP4View: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var passwsord = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            TextField("Enter your name : " , text  : $name)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $passwsord)
                .textFieldStyle(.roundedBorder)
            
            
            Button("Se connecter") {
                            print("Connexion demandée")
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
                
            
            Text("Name : \(name)")
                .padding()
            Text("Email : \(email)")
            
        }
        .padding()
        
        NavigationStack {
                    Form {
                        Section("Informations personnelles") {
                            TextField("Nom", text: $name)
                            TextField("Email", text: $email)
                        }

                        Section("Actions") {
                            Button("Enregistrer") {
                                print("Nom : \(name)")
                                print("Email : \(email)")
                            }
                        }
                    }
                    .navigationTitle("Inscription")
                }
    }
}

#Preview {
    TP4View()
}
