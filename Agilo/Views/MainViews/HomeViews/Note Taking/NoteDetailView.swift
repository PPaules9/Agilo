import SwiftUI

struct NoteDetailView: View {
    let date: Date
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Notes For \(formattedDay(date))")
                .font(.title)
                .padding(.bottom, 10)
            Text(note.text)
                .padding()
            if let image = note.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(15)
                    .frame(maxHeight: 200)
                    .padding()
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Note Detail")
    }
    
    func formattedDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}

