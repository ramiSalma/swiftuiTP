
import SwiftUI

struct TP5SMView: View {

    // MARK: - Personal information

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var email = ""
    @State private var phone = ""

    // MARK: - Additional information

    @State private var birthDate = Calendar.current.date(
        from: DateComponents(year: 2000, month: 1, day: 1)
    ) ?? Date()

    @State private var gender = "Prefer not to say"
    @State private var country = "Morocco"

    // MARK: - Password

    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showPassword = false

    // MARK: - Preferences

    @State private var receiveNotifications = true
    @State private var acceptTerms = false

    // MARK: - Validation

    @State private var submitted = false
    @State private var showSuccess = false

    private var emailIsValid: Bool {
        let parts = email.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).split(separator: "@")

        guard parts.count == 2 else { return false }

        let domain = String(parts[1])
        return !parts[0].isEmpty &&
            domain.contains(".") &&
            !domain.hasPrefix(".") &&
            !domain.hasSuffix(".")
    }

    private var phoneIsValid: Bool {
        let digits = phone.filter { $0.isNumber }
        return (8...15).contains(digits.count)
    }

    private var passwordHasMinLength: Bool {
        password.count >= 8
    }

    private var passwordHasUppercase: Bool {
        password.rangeOfCharacter(
            from: .uppercaseLetters
        ) != nil
    }

    private var passwordHasLowercase: Bool {
        password.rangeOfCharacter(
            from: .lowercaseLetters
        ) != nil
    }

    private var passwordHasNumber: Bool {
        password.rangeOfCharacter(
            from: .decimalDigits
        ) != nil
    }

    private var passwordHasSpecialCharacter: Bool {
        password.rangeOfCharacter(
            from: CharacterSet(
                charactersIn: "!@#$%^&*()-_=+[]{};:,.?"
            )
        ) != nil
    }

    private var passwordIsValid: Bool {
        passwordHasMinLength &&
        passwordHasUppercase &&
        passwordHasLowercase &&
        passwordHasNumber &&
        passwordHasSpecialCharacter
    }

    private var passwordsMatch: Bool {
        !confirmPassword.isEmpty &&
        password == confirmPassword
    }

    private var formIsValid: Bool {
        !firstName.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty &&
        !lastName.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty &&
        !username.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty &&
        emailIsValid &&
        phoneIsValid &&
        passwordIsValid &&
        passwordsMatch &&
        acceptTerms
    }

    var body: some View {
        NavigationStack {
            Form {

                // MARK: Personal information

                Section("Personal Information") {

                    TextField("First Name", text: $firstName)
                        .textContentType(.givenName)
                        .textInputAutocapitalization(.words)

                    TextField("Last Name", text: $lastName)
                        .textContentType(.familyName)
                        .textInputAutocapitalization(.words)

                    TextField("Username", text: $username)
                        .textContentType(.username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()

                    if submitted && !emailIsValid {
                        errorText("Enter a valid email address.")
                    }

                    TextField("Phone Number", text: $phone)
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)

                    if submitted && !phoneIsValid {
                        errorText(
                            "Enter a phone number with 8–15 digits."
                        )
                    }
                }

                // MARK: Additional information

                Section("Additional Information") {

                    DatePicker(
                        "Date of Birth",
                        selection: $birthDate,
                        in: ...Date(),
                        displayedComponents: .date
                    )

                    Picker("Gender", selection: $gender) {
                        Text("Female").tag("Female")
                        Text("Male").tag("Male")
                        Text("Other").tag("Other")
                        Text("Prefer not to say")
                            .tag("Prefer not to say")
                    }

                    Picker("Country", selection: $country) {
                        Text("Morocco").tag("Morocco")
                        Text("France").tag("France")
                        Text("Spain").tag("Spain")
                        Text("Other").tag("Other")
                    }
                }

                // MARK: Security

                Section("Account Security") {

                    Group {
                        if showPassword {
                            TextField(
                                "Password",
                                text: $password
                            )
                        } else {
                            SecureField(
                                "Password",
                                text: $password
                            )
                        }
                    }
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                    Button {
                        showPassword.toggle()
                    } label: {
                        Label(
                            showPassword
                                ? "Hide Password"
                                : "Show Password",
                            systemImage: showPassword
                                ? "eye.slash"
                                : "eye"
                        )
                    }
                    .buttonStyle(.plain)

                    // Live password requirements

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Password requirements")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        requirement(
                            "At least 8 characters",
                            isValid: passwordHasMinLength
                        )

                        requirement(
                            "One uppercase letter",
                            isValid: passwordHasUppercase
                        )

                        requirement(
                            "One lowercase letter",
                            isValid: passwordHasLowercase
                        )

                        requirement(
                            "One number",
                            isValid: passwordHasNumber
                        )

                        requirement(
                            "One special character",
                            isValid: passwordHasSpecialCharacter
                        )
                    }
                    .padding(.vertical, 4)

                    SecureField(
                        "Confirm Password",
                        text: $confirmPassword
                    )
                    .textContentType(.newPassword)

                    if !confirmPassword.isEmpty {
                        Label(
                            passwordsMatch
                                ? "Passwords match"
                                : "Passwords do not match",
                            systemImage: passwordsMatch
                                ? "checkmark.circle.fill"
                                : "xmark.circle.fill"
                        )
                        .font(.caption)
                        .foregroundStyle(
                            passwordsMatch ? .green : .red
                        )
                    }
                }

                // MARK: Preferences

                Section("Preferences") {

                    Toggle(
                        "Receive notifications",
                        isOn: $receiveNotifications
                    )

                    Toggle(
                        "I accept the Terms and Conditions",
                        isOn: $acceptTerms
                    )

                    if submitted && !acceptTerms {
                        errorText(
                            "You must accept the terms to register."
                        )
                    }
                }

                // MARK: Registration

                Section {

                    Button {
                        register()
                    } label: {
                        HStack {
                            Spacer()

                            Text("Create Account")
                                .fontWeight(.semibold)

                            Spacer()
                        }
                    }
                    .disabled(submitted && formIsValid)
                    .listRowBackground(
                        Color.blue.opacity(0.12)
                    )

                    if submitted && !formIsValid {
                        Text(
                            "Please correct the highlighted fields."
                        )
                        .foregroundStyle(.red)
                        .font(.footnote)
                    }
                }
            }
            .navigationTitle("Create Account")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Registration Successful",
                   isPresented: $showSuccess) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(
                    "Welcome, \(firstName)! Your form is valid."
                )
            }
        }
    }

    // MARK: - Helper views

    private func errorText(_ message: String) -> some View {
        Text(message)
            .font(.caption)
            .foregroundStyle(.red)
    }

    private func requirement(
        _ title: String,
        isValid: Bool
    ) -> some View {
        Label(
            title,
            systemImage: isValid
                ? "checkmark.circle.fill"
                : "circle"
        )
        .font(.caption)
        .foregroundStyle(
            isValid ? .green : .secondary
        )
    }

    // MARK: - Register

    private func register() {
        submitted = true

        guard formIsValid else {
            return
        }

        showSuccess = true

        // In a real app, send the registration data
        // to your backend API here.
    }
}

#Preview {
    TP5SMView()
}
