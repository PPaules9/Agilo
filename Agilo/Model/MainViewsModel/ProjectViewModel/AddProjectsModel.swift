import SwiftUI
import UIKit

//MARK: - Event Structure

struct BackLog: Identifiable, Hashable, Codable {
    
    var id = UUID()
    var title = ""
    var energyUnit = 1
    var criticalDeadline = Date.now
}
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


//MARK: - Project
struct Project: Identifiable, Hashable, Codable {
    var id = UUID()
    var symbol: String = EventSymbols.randomName()
    var color: RGBAColor = ColorOptions.random().rgbaColor
    var name = ""
//    var image : UIImage? = nil
    
    var selected = false
    var isDone: Bool = false
    
    var scrumMaster = ""
    var productOwner = ""
    var teamMembers = ["You"]
    
    var sprint = 2
    var startDay = Date.now
    var deadLine = Date.now
    
//    var milestones = In every milestone specific tasks
    var backlogTasks = [BackLog(title: "", energyUnit: 1, criticalDeadline: Date.now)]
    var sprintBacklog = [""]
    
    var noteText: String = ""
    var notes: [String] = []
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
                backlogTasks: [
                    BackLog(title: "Tiers", energyUnit: 10),
                    BackLog(title: "Wheels", energyUnit: 5, criticalDeadline: Date.now),
                    BackLog(title: "Air Conditioning", energyUnit: 3),
                    BackLog(title: "Motor", energyUnit: 15),
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
                backlogTasks: [
                    BackLog(title: "Tiers", energyUnit: 10),
                    BackLog(title: "Wheels", energyUnit: 5),
                    BackLog(title: "Air Conditioning", energyUnit: 3),
                    BackLog(title: "Motor", energyUnit: 15),
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
                backlogTasks: [
                    BackLog(title: "Tiers", energyUnit: 10),
                    BackLog(title: "Wheels", energyUnit: 5),
                    BackLog(title: "Air Conditioning", energyUnit: 3),
                    BackLog(title: "Motor", energyUnit: 15),
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
    
    // Catch the activated project
    func getActiveProject() -> Project? {
            return projects.first { $0.selected }
    }
    
    //Disable any other projets if user activates another one
    func activateProject(_ project: Project) {
            for i in 0..<projects.count {
                projects[i].selected = projects[i].id == project.id
            }
            // Notify that projects array has changed
            objectWillChange.send()
        }
    
}

