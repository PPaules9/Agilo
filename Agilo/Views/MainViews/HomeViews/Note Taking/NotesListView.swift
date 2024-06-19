import SwiftUI

struct NotesListView: View {
    @State var notes: [Note]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedNotes.keys.sorted(by: >), id: \.self) { monthYear in
                    Section(header: Text(monthYear)) {
                        ForEach(groupedNotes[monthYear]!) { note in
                            NavigationLink(destination: NoteDetailView(note: note)) {
                                VStack(alignment: .leading) {
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
                                .padding(.vertical, 5)
                            }
                        }
                        .onDelete { indexSet in
                            deleteNotes(at: indexSet, in: monthYear)
                        }
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private var groupedNotes: [String: [Note]] {
        Dictionary(grouping: notes) { note in
            let monthYearFormatter = DateFormatter()
            monthYearFormatter.dateFormat = "MMMM yyyy"
            return monthYearFormatter.string(from: note.date)
        }
    }
    
    private func deleteNotes(at offsets: IndexSet, in monthYear: String) {
        if var monthNotes = groupedNotes[monthYear] {
            for index in offsets {
                if let noteIndex = notes.firstIndex(where: { $0.id == monthNotes[index].id }) {
                    notes.remove(at: noteIndex)
                }
            }
        }
    }
}

// DateFormatter for date display
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()


