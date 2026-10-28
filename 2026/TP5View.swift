//
//  TP5View.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct TP5View: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var acceptedTerms = false
    @State private var showSuccess = false
    
    var isValid: Bool {
           !name.trimmingCharacters(in: .whitespaces).isEmpty &&
           email.contains("@") &&
           password.count >= 8 &&
           acceptedTerms
       }
    
    var body: some View {
        
        Form {
            Section("Informations") {
                TextField("Nom", text: $name)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)

                SecureField("Mot de passe", text: $password)

                Toggle(
                    "Accepter les conditions",
                    isOn: $acceptedTerms
                )
            }

            Section {
                Button("S'inscrire") {
                    if isValid {
                        showSuccess = true
                    }
                }

                if showSuccess {
                    Text("Formulaire valide !")
                        .foregroundStyle(.green)
                }
            }
        }
    }
}

#Preview {
    TP5View()
}
