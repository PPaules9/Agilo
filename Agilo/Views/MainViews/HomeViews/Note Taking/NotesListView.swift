
import SwiftUI

struct NotesListView: View {
    let notes: [Date: Note]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes.keys.sorted(), id: \.self) { date in
                    NavigationLink(destination: NoteDetailView(date: date, note: notes[date]!)) {
                        Text("Notes for \(formattedDay(date))")
                    }
                }
            }
            .navigationTitle("Notes")
        }
    }
    
    func formattedDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}
