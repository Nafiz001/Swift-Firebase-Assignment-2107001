import SwiftUI

struct ContentView: View {
    
    @StateObject var authVM = AuthViewModel()
    
    var body: some View {
        if authVM.user == nil {
            LoginView()
                .environmentObject(authVM)
        } else {
            NotesView()
                .environmentObject(authVM)
        }
    }
}
