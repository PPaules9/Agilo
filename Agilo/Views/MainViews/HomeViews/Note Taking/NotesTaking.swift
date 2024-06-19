import SwiftUI

struct CalendarView: View {
    // States
    @State private var currentDate = Date()
    @State private var selectedDate: Date?
    @State private var notes: [Date: String] = [:]
    @State private var noteText: String = "Enter Your Notes, Spikes & Comments of the Day"
    @State private var visibleMonth: Date = Date()
    @FocusState private var isNoteEditorFocused: Bool
    
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
                    withAnimation(.easeInOut) {
                        visibleMonth = currentDate.startOfMonth()
                        scrollToCurrentDate()
                    }
                }) {
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.title)
                }
            }
            .padding()
            
            // Scrollable Calendar View
            
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { scrollViewProxy in
                    LazyHStack(spacing: 0) {
                        ForEach(0..<60, id: \.self) { offset in
                            let month = Calendar.current.date(byAdding: .month, value: offset, to: currentDate.startOfMonth())!
                            MonthView(
                                currentDate: $currentDate,
                                month: month,
                                selectedDate: $selectedDate,
                                notes: $notes,
                                noteText: $noteText
                            )
                            .frame(width: UIScreen.main.bounds.width)
                            .id(month)
                            .transition(.slide)
                            .animation(.easeInOut, value: visibleMonth)
                        }
                        .onAppear {
                            selectedDate = currentDate
                            visibleMonth = currentDate.startOfMonth()
                            noteText = "Enter Your Notes, Spikes & Comments of the Day"
                            scrollToCurrentDate()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                let width = UIScreen.main.bounds.width
                                let dragThreshold = width / 2
                                let dragAmount = value.translation.width
                                
                                if dragAmount < -dragThreshold {
                                    scrollToNextMonth(scrollViewProxy)
                                } else if dragAmount > dragThreshold {
                                    scrollToPreviousMonth(scrollViewProxy)
                                } else {
                                    scrollToCurrentMonth(scrollViewProxy)
                                }
                            }
                    )
                }
                .frame(height: 390)
            }
            
            // Note Editor
            if let selectedDate = selectedDate {
                VStack {
                    Text("Notes for \(formattedDay(selectedDate))")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.orange)
                    
                    ZStack(alignment: .bottomTrailing) {
                        TextEditor(text: $noteText)
                            .foregroundColor(.primary)
                            .background(Color.clear)
                            .shadow(radius: 0.5)
                            .frame(width: 340, height: 280)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(15)
                            .shadow(radius: 3)
                            .onChange(of: noteText) { _, newValue in
                                notes[selectedDate] = newValue
                            }
                            .focused($isNoteEditorFocused)
                        
                        // Done button in the toolbar
                        if isNoteEditorFocused {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        isNoteEditorFocused = false
                                    }) {
                                        Text("Done")
                                            .padding(.horizontal, 15)
                                            .padding(.vertical, 8)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                    .padding(.trailing, 20)
                                    .padding(.bottom, 20)
                                }
                            }
                        }
                    }
                }
                .offset(y: -40)
                .padding()
            }
            Spacer()
        }
        .padding(.top)
    }
    
    // Helper function to format the selected day
    func formattedDay(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Function to scroll to the current date
    private func scrollToCurrentDate() {
        guard let currentIndex = (0..<60).firstIndex(where: { Calendar.current.isDate(visibleMonth, equalTo: Calendar.current.date(byAdding: .month, value: $0, to: currentDate.startOfMonth())!, toGranularity: .month) }) else {
            return
        }
        
        withAnimation(.easeInOut) {
            scrollToMonth(index: currentIndex)
        }
    }
    
    // Function to scroll to a specific month by index
    private func scrollToMonth(index: Int) {
        withAnimation(.easeInOut) {
            visibleMonth = Calendar.current.date(byAdding: .month, value: index, to: currentDate.startOfMonth())!
        }
    }
    
    // Scroll to the next month
    private func scrollToNextMonth(_ scrollViewProxy: ScrollViewProxy) {
        guard let currentIndex = (0..<60).firstIndex(where: { Calendar.current.isDate(visibleMonth, equalTo: Calendar.current.date(byAdding: .month, value: $0, to: currentDate.startOfMonth())!, toGranularity: .month) }),
              currentIndex + 1 < 60 else { return }
        scrollViewProxy.scrollTo(Calendar.current.date(byAdding: .month, value: currentIndex + 1, to: currentDate.startOfMonth())!, anchor: .center)
        visibleMonth = Calendar.current.date(byAdding: .month, value: currentIndex + 1, to: currentDate.startOfMonth())!
    }
    
    // Scroll to the previous month
    private func scrollToPreviousMonth(_ scrollViewProxy: ScrollViewProxy) {
        guard let currentIndex = (0..<60).firstIndex(where: { Calendar.current.isDate(visibleMonth, equalTo: Calendar.current.date(byAdding: .month, value: $0, to: currentDate.startOfMonth())!, toGranularity: .month) }),
              currentIndex - 1 >= 0 else { return }
        scrollViewProxy.scrollTo(Calendar.current.date(byAdding: .month, value: currentIndex - 1, to: currentDate.startOfMonth())!, anchor: .center)
        visibleMonth = Calendar.current.date(byAdding: .month, value: currentIndex - 1, to: currentDate.startOfMonth())!
    }
    
    // Scroll back to the current month
    private func scrollToCurrentMonth(_ scrollViewProxy: ScrollViewProxy) {
        guard let currentIndex = (0..<60).firstIndex(where: { Calendar.current.isDate(visibleMonth, equalTo: Calendar.current.date(byAdding: .month, value: $0, to: currentDate.startOfMonth())!, toGranularity: .month) }) else { return }
        scrollViewProxy.scrollTo(Calendar.current.date(byAdding: .month, value: currentIndex, to: currentDate.startOfMonth())!, anchor: .center)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct MonthView: View {
    @Binding var currentDate: Date
    var month: Date
    @Binding var selectedDate: Date?
    @Binding var notes: [Date: String]
    @Binding var noteText: String
    
    // Computed property to generate days in the current month
    private var daysInMonth: [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: month)!
        return range.map { day -> Date in
            var components = calendar.dateComponents([.year, .month], from: month)
            components.day = day
            return calendar.date(from: components)!
        }
    }
    
    // Offset for the first day of the month
    private var startDayOffset: Int {
        let calendar = Calendar.current
        let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: month))!
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        return weekday - 1 // Make Sunday = 0, Monday = 1, etc.
    }
    
    // Helper function to check if two dates are the same day
    private func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        Calendar.current.isDate(date1, inSameDayAs: date2)
    }
    
    var body: some View {
        VStack {
            // Days of the Week
            HStack(spacing: 22) {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day)
                }
            }
            .frame(width: 500)
            
            // Calendar Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns) {
                // Add empty cells for days of the week before the first day of the month
                ForEach(0..<startDayOffset, id: \.self) { _ in
                    Text("")
                        .frame(width: 25, height: 25)
                }
                
                // Add day cells
                ForEach(daysInMonth, id: \.self) { date in
                    Button(action: {
                        selectedDate = date
                        noteText = notes[date] ?? ""
                    }) {
                        Text("\(Calendar.current.component(.day, from: date))")
                            .frame(width: 23)
                            .padding()
                            .background(isSameDay(date, Date()) ? Color.cyan : (isSameDay(date, selectedDate ?? Date()) ? Color.pink : Color.clear))
                            .foregroundColor((isSameDay(date, Date()) || isSameDay(date, selectedDate ?? Date())) ? Color.white : Color.black)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

extension Date {
    // Helper function to get the start of the month
    func startOfMonth() -> Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
    }
}
