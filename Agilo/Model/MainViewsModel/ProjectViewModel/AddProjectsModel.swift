import SwiftUI


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




//MARK: - EventTask

struct EventTask: Identifiable, Hashable, Codable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}

//MARK: - Project
struct Project: Identifiable, Hashable, Codable {
    var id = UUID()
    var name = ""
    var activated = true
    var isDone: Bool = false
    var scrumMaster = ""
    var teamMembers = ["Andrew", "Jan", "Leo", "Theo"]
    var sprint = 1
    var deadLine = Date.now
    var isActive = false

    var activeProject: String {
        if isActive {
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
                scrumMaster: "Pavly",
                teamMembers: ["Andrew", "Jan", "Leo", "Theo"],
                sprint: 5,
                deadLine: Date.now
            ),
            Project(
                name: "Building a Website",
                activated: false,
                isDone: false,
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
