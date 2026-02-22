import Foundation
import Combine
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    
    @Published var notes: [String] = []
    private let db = Firestore.firestore()
    
    func fetchNotes() {
        db.collection("notes").order(by: "timestamp")
            .addSnapshotListener { snapshot, error in
                if let documents = snapshot?.documents {
                    self.notes = documents.compactMap {
                        $0["text"] as? String
                    }
                }
            }
    }
    
    func addNote(text: String) {
        db.collection("notes").addDocument(data: [
            "text": text,
            "timestamp": Timestamp()
        ])
    }
}
