import SwiftUI

struct NoteDetailView: View {
    var note: Note
    
    var body: some View {
        VStack {
            Text("\(note.date, formatter: dateFormatter)")
                .font(.caption)
                .foregroundColor(.gray)
            if !note.text.isEmpty {
                Text(note.text)
                    .padding(.bottom, 5)
            }
            if let image = note.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .frame(height: 200)
                    .clipped()
            }
        }
        .navigationTitle("Note Detail")
        .padding()
    }
}

// Preview for testing
struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView(notes: [
            Note(date: Date(), text: "Sample Note 1", image: UIImage(systemName: "photo")),
            Note(date: Date().addingTimeInterval(-86400), text: "Sample Note 2", image: nil)
        ])
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
