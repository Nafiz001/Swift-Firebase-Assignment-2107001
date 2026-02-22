import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Lab04 Login")
                .font(.largeTitle)
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Login") {
                authVM.login(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
            
            Button("Sign Up") {
                authVM.signUp(email: email, password: password)
            }
        }
        .padding()
    }
}

