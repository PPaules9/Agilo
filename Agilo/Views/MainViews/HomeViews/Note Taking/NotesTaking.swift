import SwiftUI
import PhotosUI

struct NotesTaking: View {
    // States
    @Binding var newProject : Project
    @State private var notes: [Note] = []
    @State private var noteText: String = ""
    @State private var showingNotesSheet = false
    @State private var showingImagePicker = false
    @State private var showingCamera = false
    @State private var selectedImage: UIImage? = nil
    @FocusState private var isNoteEditorFocused: Bool
    @State private var showingSaveAlert = false
    
    var body: some View {
        VStack {
            // Header Section
            HStack {
                Text("Project Diary")
                    .font(.title)
                    .fontWeight(.bold)
                Image(systemName: "book.pages")

                Spacer()
                Button(action: {
                    showingNotesSheet = true
                }) {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.title)
                        .foregroundStyle(Color.orange)
                }
                .sheet(isPresented: $showingNotesSheet) {
                    NotesListView(notes: notes)
                }
            }
            .padding()
            
            Divider()
            
            // Note Editor Section
            ScrollView {
                VStack {
                    Text("\(Date(), formatter: dateFormatter)")
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                    
                    RichTextEditor(text: $noteText, isFocused: $isNoteEditorFocused)
                        .frame(height: 400)
                        .focused($isNoteEditorFocused)
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(15)
                    }
                }
                .padding()
            }
            .gesture(DragGesture().onChanged { _ in
                hideKeyboard()
            })
            
            Spacer()
            
            // Toolbar Section
            HStack {
                Button(action: {
                    saveNote()
                    clearNote()
                }) {
                    Text("Save")
                        .font(.title3)
                }
                Spacer()
                Button(action: {
                    showingImagePicker = true
                }) {
                    Image(systemName: "paperclip")
                        .font(.title2)
                }
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $selectedImage)
                }
                Spacer()
                
                Button(action: {
                    showingCamera = true
                }) {
                    Image(systemName: "camera")
                        .font(.title2)
                }
                .sheet(isPresented: $showingCamera) {
                    PhotoCaptureView(image: $selectedImage)
                }
                Spacer()
                Button(action: {
                    if !noteText.isEmpty || selectedImage != nil {
                        showingSaveAlert = true
                    } else {
                        clearNote()
                    }
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                }
                .alert(isPresented: $showingSaveAlert) {
                    Alert(
                        title: Text("Save Note"),
                        message: Text("Do you want to save the current note?"),
                        primaryButton: .default(Text("Save")) {
                            saveNote()
                            clearNote()
                        },
                        secondaryButton: .cancel(Text("Cancel")) {
                            showingSaveAlert = false
                        }
                    )
                }
            }
            .padding()
            .foregroundStyle(Color.orange)
        }
    }
    
   
    private func saveNote() {
        let note = Note(date: Date(), text: noteText, image: selectedImage)
        notes.append(note)
        // Convert notes array to array of strings
        var notesStrings = convertNotesToStrings(notes: notes)
        print(notesStrings)  // Print to console for testing purposes
        
        notesStrings = newProject.notes
    }
    
    private func convertNotesToStrings(notes: [Note]) -> [String] {
           return notes.map { $0.text }
       }
    
    private func clearNote() {
        noteText = ""
        selectedImage = nil
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Note: Identifiable {
    let id = UUID()
    var date: Date
    var text: String
    var image: UIImage?
}


// DateFormatter for date display
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    NotesTaking(newProject: .constant(Project()))
}
