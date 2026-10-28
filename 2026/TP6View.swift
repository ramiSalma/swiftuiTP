//
//  TP6View.swift
//  2026
//
//  Created by Bits on 13/10/2026.
//

import SwiftUI

struct TP6View: View {
    @State private var name = ""
        @State private var email = ""
        @State private var password = ""
        @State private var bio = ""
        @State private var gender = "Female"
        @State private var birthDate = Date()
        @State private var age = 18.0
        @State private var accepted = false
        @State private var notifications = true

        var body: some View {
            NavigationStack {
                Form {

                    Section("Personal information") {
                        TextField("Full name", text: $name)

                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)

                        SecureField("Password", text: $password)

                        Picker("Gender", selection: $gender) {
                            Text("Female").tag("Female")
                            Text("Male").tag("Male")
                            Text("Other").tag("Other")
                        }

                        DatePicker(
                            "Birth date",
                            selection: $birthDate,
                            displayedComponents: .date
                        )
                    }

                    Section("Additional information") {
                        VStack(alignment: .leading) {
                            Text("Age: \(Int(age))")
                            Slider(value: $age, in: 18...60, step: 1)
                        }

                        TextEditor(text: $bio)
                            .frame(height: 100)

                        Toggle("Enable notifications",
                               isOn: $notifications)
                    }

                    Section("Conditions") {
                        Toggle("I accept the conditions",
                               isOn: $accepted)
                    }

                    Section {
                        Button("Register") {
                            print("Name: \(name)")
                            print("Email: \(email)")
                            print("Gender: \(gender)")
                        }
                        .disabled(
                            name.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            !accepted
                        )
                    }
                }
                .navigationTitle("Registration")
            }
        }
}

#Preview {
    TP6View()
}
