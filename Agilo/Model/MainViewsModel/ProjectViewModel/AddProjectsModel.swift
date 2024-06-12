import SwiftUI

//MARK: - Event Structure

struct BackLog: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var title = ""
//    var tasks = [BackLogTask(text: "")]
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
    
//    var remainingTaskCount: Int {
//        tasks.filter {
//            !$0.isCompleted && !$0.text.isEmpty
//        }.count
//    }
    
//    var isComplete: Bool {
//        tasks.allSatisfy { $0.isCompleted || $0.text.isEmpty }
//    }
    
    
    static var example = BackLog(
        title: "Sayulita Trip",
//        tasks: [
//            BackLogTask(text: "Buy plane tickets"),
//            BackLogTask(text: "Get a new bathing suit"),
//            BackLogTask(text: "Find an airbnb"),
//        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
    
    
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
//    var milestones = [BackLog()]
    var scrumMaster = ""
    var teamMembers = ["Andrew", "Jan", "Leo", "Theo"]
    var sprint = 1
    var deadLine = Date.now
    
    static var deleteProject: Project {
        Project(id: UUID(), name: "Deleted Project", activated: false)
    }
    
    var activeProject: String {
        if activated {
            return "Paused"
        } else {
            return "Active"
        }
    }
    
}

@Observable
class ProjectData {
    var projects: [Project] = []
    
    init() {
        projects = [
            Project(
                name: "Building a car",
                activated: true,
                isDone: false,
//                milestones: [BackLog(
//                    title: "Design and Planning",
////                    tasks: [BackLogTask(text: "Conceptualize "),
////                            BackLogTask(text: "detailed blueprints"),
////                            BackLogTask(text: "Establish supply chain"),
////                           ],
//                    date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)
//                ),BackLog(
////                    title: "Chassis and Frame",
////                    tasks: [BackLogTask(text: "Buy new tux"),
////                            BackLogTask(text: "Get tickets"),
////                            BackLogTask(text: "Book a flight for Carmen"),
////                           ],
//                    date: Date.roundedHoursFromNow(60 * 60 * 22)
//                )
//                ],
                scrumMaster: "Pavly",
                teamMembers: ["Andrew", "Jan", "Leo", "Theo"],
                sprint: 5,
                deadLine: Date.now
            ),
            Project(
                name: "Building a Website",
                activated: false,
                isDone: false,
//                milestones: [BackLog(
//                    title: "Design and Planning",
////                    tasks: [BackLogTask(text: "Conceptualize "),
////                            BackLogTask(text: "detailed blueprints"),
////                            BackLogTask(text: "Establish supply chain"),
////                           ],
//                    date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)
//                ),BackLog(
//                    title: "Chassis and Frame",
////                    tasks: [BackLogTask(text: "Buy new tux"),
////                            BackLogTask(text: "Get tickets"),
////                            BackLogTask(text: "Book a flight for Carmen"),
////                           ],
//                    date: Date.roundedHoursFromNow(60 * 60 * 22)
//                )
//                ],
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




