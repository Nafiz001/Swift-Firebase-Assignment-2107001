import SwiftUI

struct NotesView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @StateObject var noteVM = NoteViewModel()
    @State private var newNote = ""
    
    var body: some View {
        VStack {
            
            List(noteVM.notes, id: \.self) { note in
                Text(note)
            }
            
            HStack {
                TextField("New note", text: $newNote)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add") {
                    if !newNote.isEmpty {
                        noteVM.addNote(text: newNote)
                        newNote = ""
                    }
                }
            }
            .padding()
            
            Button("Logout") {
                authVM.logout()
            }
            .foregroundColor(.red)
        }
        .onAppear {
            noteVM.fetchNotes()
        }
    }
}
