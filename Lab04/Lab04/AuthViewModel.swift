import Foundation
import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var user: User?
    
    init() {
        self.user = Auth.auth().currentUser
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                DispatchQueue.main.async {
                    self.user = user
                }
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                DispatchQueue.main.async {
                    self.user = user
                }
            }
        }
    }
    
    func logout() {
        try? Auth.auth().signOut()
        self.user = nil
    }
}
