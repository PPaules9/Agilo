import SwiftUI

//MARK: - Dealing With Colors
struct ColorOptions: Codable {
    static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .cyan,
        .indigo,
        .purple,
        .teal,
    ]
    
    static var `default` : Color = Color.primary
    
    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return .primary
        }
        
    }
}

struct RGBAColor: Codable, Hashable {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
}

extension Color {
    var r: CGFloat { UIColor(self).colorComponents.red }
    var g: CGFloat { UIColor(self).colorComponents.green }
    var b: CGFloat { UIColor(self).colorComponents.blue }
    var a: CGFloat { UIColor(self).colorComponents.alpha }
    
    var rgbaColor: RGBAColor {
        RGBAColor(r: self.r, g: self.g, b: self.b, a: self.a)
    }
    
    init(_ rgbaColor: RGBAColor) {
        self.init(red: rgbaColor.r, green: rgbaColor.g, blue: rgbaColor.b, opacity: rgbaColor.a)
    }
}

extension UIColor {
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)

        return (r, g, b, a)
    }
}


//MARK: - Custome Label Style with icon
struct CustomLabelStyle: LabelStyle {
  @ScaledMetric private var iconWidth: Double = 40
  func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: 0) {
      configuration.icon
        .imageScale(.large)
        .frame(width: iconWidth)
      configuration.title
    }
  }
}

//MARK: - Handling Event Symbols
struct EventSymbols {
    static func randomName() -> String {
        if let random = symbolNames.randomElement() {
            return random
        } else {
            return ""
        }
    }
    
    static func randomNames(_ number: Int) -> [String] {
        var names: [String] = []
        for _ in 0..<number {
            names.append(randomName())
        }
        return names
    }
        
    static var symbolNames: [String] = [
        "house.fill",
        "ticket.fill",
        "gamecontroller.fill",
        "theatermasks.fill",
        "ladybug.fill",
        "books.vertical.fill",
        "moon.zzz.fill",
        "umbrella.fill",
        "paintbrush.pointed.fill",
        "leaf.fill",
        "globe.americas.fill",
        "clock.fill",
        "building.2.fill",
        "gift.fill",
        "graduationcap.fill",
        "heart.rectangle.fill",
        "phone.bubble.left.fill",
        "cloud.rain.fill",
        "building.columns.fill",
        "mic.circle.fill",
        "comb.fill",
        "person.3.fill",
        "bell.fill",
        "hammer.fill",
        "star.fill",
        "crown.fill",
        "briefcase.fill",
        "speaker.wave.3.fill",
        "tshirt.fill",
        "tag.fill",
        "airplane",
        "pawprint.fill",
        "case.fill",
        "creditcard.fill",
        "infinity.circle.fill",
        "dice.fill",
        "heart.fill",
        "camera.fill",
        "bicycle",
        "radio.fill",
        "car.fill",
        "flag.fill",
        "map.fill",
        "figure.wave",
        "mappin.and.ellipse",
        "heart.text.square.fill",
        "eyeglasses",
        "tram.fill",
    ]
}

//MARK: - TaskRow

struct TaskRow: View {
    @Binding var task: EventTask
    var focusedTask: FocusState<EventTask?>.Binding

    var body: some View {
        HStack {
            Button {
                task.isCompleted.toggle()
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
            .buttonStyle(.plain)

            TextField("Task Description", text: $task.text, axis: .vertical)
                .focused(focusedTask, equals: task)
            Spacer()
        }
    }
}

//MARK: - Event Structure

struct Event: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var title = ""
    var tasks = [EventTask(text: "")]
    var date = Date.now
    var scrumMaster = ""
    var teamMembers = [String]()
    var sprint = 1
    
    var period: Period {
        if date < Date.now{
            return .past
            
        } else if date < Date.now.sevenDaysOut {
            return .nextSevenDays
            
        } else if date < Date.now.thirtyDaysOut {
            return .nextThirtyDays
            
        } else {
            return .future
        }
    }
    
    var remainingTaskCount: Int {
        tasks.filter {
            !$0.isCompleted && !$0.text.isEmpty
        }.count
    }
    
    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted || $0.text.isEmpty }
    }


    static var example = Event(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            EventTask(text: "Buy plane tickets"),
            EventTask(text: "Get a new bathing suit"),
            EventTask(text: "Find an airbnb"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
    
    static var delete = Event(symbol: "trash")
    
                         
}


enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}

extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date.now
        }
    }

    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
}


//MARK: - Event Data

class EventData: ObservableObject {
    
    @Published var events: [Event] = [
        Event(symbol: "gift.fill",
              color: Color.red.rgbaColor,
              title: "Maya's Birthday",
              tasks: [EventTask(text: "Guava kombucha"),
                      EventTask(text: "Paper cups and plates"),
                      EventTask(text: "Cheese plate"),
                      EventTask(text: "Party poppers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30),
             scrumMaster: "Mr. Peter",
             teamMembers: [
                "Andrew",
                "Samier",
                "john"
             ]),
        Event(symbol: "theatermasks.fill",
              color: Color.yellow.rgbaColor,
              title: "Pagliacci",
              tasks: [EventTask(text: "Buy new tux"),
                      EventTask(text: "Get tickets"),
                      EventTask(text: "Book a flight for Carmen"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "heart.text.square.fill",
              color: Color.indigo.rgbaColor,
              title: "Health Check-up",
              tasks: [EventTask(text: "Bring medical ID"),
                      EventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "leaf.fill",
              color: Color.green.rgbaColor,
              title: "Camping Trip",
              tasks: [EventTask(text: "Find a sleeping bag"),
                      EventTask(text: "Bug spray"),
                      EventTask(text: "Paper towels"),
                      EventTask(text: "Food for 4 meals"),
                      EventTask(text: "Straw hat"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "gamecontroller.fill",
              color: Color.cyan.rgbaColor,
              title: "Game Night",
              tasks: [EventTask(text: "Find a board game to bring"),
                      EventTask(text: "Bring a dessert to share"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "graduationcap.fill",
              color: Color.primary.rgbaColor,
              title: "First Day of School",
              tasks: [
                  EventTask(text: "Notebooks"),
                  EventTask(text: "Pencils"),
                  EventTask(text: "Binder"),
                  EventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "book.fill",
              color: Color.purple.rgbaColor,
              title: "Book Launch",
              tasks: [
                  EventTask(text: "Finish first draft"),
                  EventTask(text: "Send draft to editor"),
                  EventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "globe.americas.fill",
              color: Color.gray.rgbaColor,
              title: "WWDC",
              tasks: [
                  EventTask(text: "Watch Keynote"),
                  EventTask(text: "Watch What's new in SwiftUI"),
                  EventTask(text: "Go to DT developer labs"),
                  EventTask(text: "Learn about Create ML"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
        Event(symbol: "case.fill",
              color: Color.orange.rgbaColor,
              title: "Sayulita Trip",
              tasks: [
                  EventTask(text: "Buy plane tickets"),
                  EventTask(text: "Get a new bathing suit"),
                  EventTask(text: "Find a hotel room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19),
              scrumMaster: "Mr. Peter",
              teamMembers: [
                 "Andrew",
                 "Samier",
                 "john"
              ]),
    ]

    
    func add(_ event: Event) {
        events.append(event)
    }
        
    func remove(_ event: Event) {
        events.removeAll { $0.id == event.id}
    }
    
    func sortedEvents(period: Period) -> Binding<[Event]> {
        Binding<[Event]>(
            get: {
                self.events
                    .filter { $0.period == period}
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }

    
    func getBindingToEvent(_ event: Event) -> Binding<Event>? {
        Binding<Event>(
            get: {
                guard let index = self.events.firstIndex(where: { $0.id == event.id }) else { return Event.delete }
                return self.events[index]
            },
            set: { event in
                guard let index = self.events.firstIndex(where: { $0.id == event.id }) else { return }
                self.events[index] = event
            }
        )
    }

    private static func getEventsFileURL() throws -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("events.data")
    }
    
    func load() {
        do {

            let fileURL = try EventData.getEventsFileURL()
                        let data = try Data(contentsOf: fileURL)
            events = try JSONDecoder().decode([Event].self, from: data)
            print("Events loaded: \(events.count)")
        } catch {
            print("Failed to load from file. Backup data used")
        }
    }
    
    func save() {
        do {
            let fileURL = try EventData.getEventsFileURL()
            let data = try JSONEncoder().encode(events)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])            
        } catch {
            print("Unable to save")
        }
    }
}

//MARK: - EventTask

struct EventTask: Identifiable, Hashable, Codable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

//MARK: - Project
struct projects: Identifiable, Hashable, Codable {
    var id = UUID()
    var projects = [Event]()
    var isActive = false

    var activeProject: String {
        if isActive {
            return "Paused"
        } else {
            return "Active"
        }
    }
}
