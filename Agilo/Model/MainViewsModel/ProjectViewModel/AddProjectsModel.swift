import SwiftUI

//MARK: - Event Structure

struct BackLog: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var title = ""
    var tasks = [BackLogTask(text: "")]
    var date = Date.now
    var energyUnit = 1
    
    var period: Period {
        if date < Date.now {
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


    static var example = BackLog(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            BackLogTask(text: "Buy plane tickets"),
            BackLogTask(text: "Get a new bathing suit"),
            BackLogTask(text: "Find an airbnb"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
    
    static var delete = BackLog(symbol: "trash")
                         
}


//MARK: - Event Data

class BackLogData: ObservableObject, Codable {
    
    var milestone: [BackLog] = []
    
    func add(_ event: BackLog) {
        milestone.append(event)
    }
        
    func remove(_ event: BackLog) {
        milestone.removeAll { $0.id == event.id}
    }
    
    func sortedEvents(period: Period) -> Binding<[BackLog]> {
        Binding<[BackLog]>(
            get: {
                self.milestone
                    .filter { $0.period == period}
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.milestone.firstIndex(where: { $0.id == event.id }) {
                        self.milestone[index] = event
                    }
                }
            }
        )
    }

    
    func getBindingToEvent(_ event: BackLog) -> Binding<BackLog>? {
        Binding<BackLog>(
            get: {
                guard let index = self.milestone.firstIndex(where: { $0.id == event.id }) else { return BackLog.delete }
                return self.milestone[index]
            },
            set: { event in
                guard let index = self.milestone.firstIndex(where: { $0.id == event.id }) else { return }
                self.milestone[index] = event
            }
        )
    }

    private static func getEventsFileURL() throws -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("events.data")
    }
    
    func load() {
        do {

            let fileURL = try BackLogData.getEventsFileURL()
                        let data = try Data(contentsOf: fileURL)
            milestone = try JSONDecoder().decode([BackLog].self, from: data)
            print("Events loaded: \(milestone.count)")
        } catch {
            print("Failed to load from file. Backup data used")
        }
    }
    
    func save() {
        do {
            let fileURL = try BackLogData.getEventsFileURL()
            let data = try JSONEncoder().encode(milestone)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])            
        } catch {
            print("Unable to save")
        }
    }
}

//MARK: - EventTask

struct BackLogTask: Identifiable, Hashable, Codable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

//MARK: - Project
struct Project: Identifiable, Codable {
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var name = ""
    var activated = true
    var isDone: Bool = false
    var backlogData : BackLogData
    var scrumMaster = ""
    var teamMembers = ["Andrew", "Jan", "Leo", "Theo"]
    var sprint = 1
    var deadLine = Date.now
    
    static var deleteProject: Project {
            Project(id: UUID(), name: "Deleted Project", activated: false, backlogData: BackLogData())
        }

    var activeProject: String {
        if activated {
            return "Paused"
        } else {
            return "Active"
        }
    }
    
}

class ProjectData: ObservableObject {
    @Published var projects: [Project] = []
        
        init() {
            
            let backlogData = BackLogData()
            backlogData.add(BackLog(
                    color: Color.red.rgbaColor,
                    title: "Design and Planning",
                    tasks: [BackLogTask(text: "Conceptualize "),
                            BackLogTask(text: "detailed blueprints"),
                            BackLogTask(text: "Establish supply chain"),
                           ],
                    date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)
                   ))
            backlogData.add(BackLog(symbol: "theatermasks.fill",
                    color: Color.yellow.rgbaColor,
                    title: "Chassis and Frame",
                    tasks: [BackLogTask(text: "Buy new tux"),
                            BackLogTask(text: "Get tickets"),
                            BackLogTask(text: "Book a flight for Carmen"),
                           ],
                    date: Date.roundedHoursFromNow(60 * 60 * 22)
                   ))
        
            
            
            projects = [
            Project(
                name: "Building a car",
                activated: true,
                isDone: false,
                backlogData: backlogData,
                scrumMaster: "Pavly",
                teamMembers: ["Andrew", "Jan", "Leo", "Theo"],
                sprint: 5,
                deadLine: Date.now
            ),
            Project(
                name: "Building a Website",
                activated: true,
                isDone: false,
                backlogData: backlogData,
                scrumMaster: "ds",
                teamMembers: ["Anddcafrew", "Jandsa", "Leo", "Theo"],
                sprint: 5,
                deadLine: Date.now
            )
            ]
        }
    
    
    func add(_ project: Project) {
        projects.append(project)
    }
        
    func remove(_ project: Project) {
        projects.removeAll { $0.id == project.id}
    }
    

    
    func getBindingToEvent(_ event: Project) -> Binding<Project>? {
        Binding<Project>(
            get: {
                guard let index = self.projects.firstIndex(where: { $0.id == event.id }) else { return Project.deleteProject }
                return self.projects[index]
            },
            set: { event in
                guard let index = self.projects.firstIndex(where: { $0.id == event.id }) else { return }
                self.projects[index] = event
            }
        )
    }
    
    
    
    private static func getEventsFileURL() throws -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("events.data")
    }
    
    func load() {
        do {

            let fileURL = try ProjectData.getEventsFileURL()
                        let data = try Data(contentsOf: fileURL)
            projects = try JSONDecoder().decode([Project].self, from: data)
            print("Events loaded: \(projects.count)")
        } catch {
            print("Failed to load from file. Backup data used")
        }
    }
    
    func save() {
        do {
            let fileURL = try ProjectData.getEventsFileURL()
            let data = try JSONEncoder().encode(projects)
            try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save")
        }
    }
}




