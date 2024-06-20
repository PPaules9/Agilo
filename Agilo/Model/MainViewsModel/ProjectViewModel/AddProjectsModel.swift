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
    
    var sprint = 2
    
    var startDay = Date.now
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
                sprint: 3,
                startDay: Date.now,
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
                sprint: 3,
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
                sprint: 3,
                deadLine: Date.now,
                backlogMilestone: [
                    BackLog(title: "Tiers", date: Date.now, energyUnit: 10),
                    BackLog(title: "Wheels", date: Date.now, energyUnit: 5),
                    BackLog(title: "Air Conditioning", date: Date.now, energyUnit: 3),
                    BackLog(title: "Motor", date: Date.now, energyUnit: 15),
                ]
            )
    ]
    
    // Add New Project (append to the Array)
    func add(_ project: Project) {
        projects.append(project)
    }
    
    // remove a project from the list View in MyProjects
    func removeItems(at offset: IndexSet) {
        projects.remove(atOffsets: offset)
    }
    
    // Catch the Activates project
    func getActiveProject() -> Project? {
            return projects.first { $0.selected }
    }
    
}

