import Foundation

struct Plant: Identifiable {
    let id = UUID()
    var name: String
    var careInstructions: String
    var wateringInterval: TimeInterval
    var lastWateredDate: Date?
    var sunlightRequirement: String
}

