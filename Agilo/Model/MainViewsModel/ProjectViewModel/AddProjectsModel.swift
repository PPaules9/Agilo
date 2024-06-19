import SwiftUI

//MARK: - Event Structure

struct BackLog: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var title = ""
    var date = Date.now
    var energyUnit = 1
    
    
//    var period: Period {
//        if date < Date.now {
//            return .past
//            
//        } else if date < Date.now.sevenDaysOut {
//            return .nextSevenDays
//            
//        } else if date < Date.now.thirtyDaysOut {
//            return .nextThirtyDays
//            
//        } else {
//            return .future
//        }
//    }
    
//    var remainingTaskCount: Int {
//        tasks.filter {
//            !$0.isCompleted && !$0.text.isEmpty
//        }.count
//    }
    
//    var isComplete: Bool {
//        tasks.allSatisfy { $0.isCompleted || $0.text.isEmpty }
//    }


    static var example = BackLog(
//        symbol: "case.fill",
        title: "Sayulita Trip",
//        tasks: [
//            BackLogTask(text: "Buy plane tickets"),
//            BackLogTask(text: "Get a new bathing suit"),
//            BackLogTask(text: "Find an airbnb"),
//        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
    
//    static var delete = BackLog(symbol: "trash")
                         
}

//MARK: - EventTask

struct BackLogTask: Identifiable, Hashable, Codable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

//MARK: - Project
struct Project: Identifiable, Hashable, Codable {
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var name = ""
    var selected = false
    var isDone: Bool = false
    
    var scrumMaster = ""
    var productOwner = ""
    var teamMembers = ["Andrew", "Jan", "Leo", "Theo"]
    
    var weeksInSprint = 2
    var sprint = 2
    
    var deadLine = Date.now
    var backlogMilestone = [BackLog(title: "", date: Date.now, energyUnit: 1)]
    
    var noteText: String = ""
    var notes: [String] = []
    
    
    
//    static var deleteProject: Project {
//            Project(id: UUID(), name: "Deleted Project", activated: false)
//        }

//    var activeProject: String {
//        if activated {
//            return "Paused"
//        } else {
//            return "Active"
//        }
//    }
    
}

class ProjectData: ObservableObject {
    @Published var projects: [Project] = [
            Project(
                symbol: "case.fill",
                color: Color.cyan.rgbaColor,
                name: "Building a car",
                selected: true,
                isDone: false,
                scrumMaster: "Pavly",
                teamMembers: ["Andrew", "Jan", "Leo", "Theo"],
                weeksInSprint: 5,
                deadLine: Date.now,
                backlogMilestone: [
                    BackLog(title: "Tiers", date: Date.now, energyUnit: 10),
                    BackLog(title: "Wheels", date: Date.now, energyUnit: 5),
                    BackLog(title: "Air Conditioning", date: Date.now, energyUnit: 3),
                    BackLog(title: "Motor", date: Date.now, energyUnit: 15),
                ]
            ),
            Project(
                symbol: "gift.fill",
                color: Color.primary.rgbaColor,
                name: "Building a Website",
                selected: false,
                isDone: false,
                scrumMaster: "ds",
                teamMembers: ["Anddcafrew", "Jandsa", "Leo", "Theo"],
                weeksInSprint: 5,
                deadLine: Date.now,
                backlogMilestone: [
                    BackLog(title: "Tiers", date: Date.now, energyUnit: 10),
                    BackLog(title: "Wheels", date: Date.now, energyUnit: 5),
                    BackLog(title: "Air Conditioning", date: Date.now, energyUnit: 3),
                    BackLog(title: "Motor", date: Date.now, energyUnit: 15),
                ]
            ),
            Project(
                symbol: "leaf.fill",
                color: Color.purple.rgbaColor,
                name: "Building The Pyramids",
                selected: false,
                isDone: false,
                scrumMaster: "ds",
                teamMembers: ["Nader", "Jandsa", "Leo", "Theo"],
                weeksInSprint: 5,
                deadLine: Date.now,
                backlogMilestone: [
                    BackLog(title: "Tiers", date: Date.now, energyUnit: 10),
                    BackLog(title: "Wheels", date: Date.now, energyUnit: 5),
                    BackLog(title: "Air Conditioning", date: Date.now, energyUnit: 3),
                    BackLog(title: "Motor", date: Date.now, energyUnit: 15),
                ]
            )
    ]
    
    func add(_ project: Project) {
        projects.append(project)
    }
        
    func remove(_ project: Project) {
        projects.removeAll { $0.id == project.id}
    }
    
    func removeItems(at offset: IndexSet) {
        projects.remove(atOffsets: offset)
    }

    
//    func getBindingToEvent(_ event: Project) -> Binding<Project>? {
//        Binding<Project>(
//            get: {
//                guard let index = self.projects.firstIndex(where: { $0.id == event.id }) else { return Project.deleteProject }
//                return self.projects[index]
//            },
//            set: { event in
//                guard let index = self.projects.firstIndex(where: { $0.id == event.id }) else { return }
//                self.projects[index] = event
//            }
//        )
//    }
    
    
    
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
