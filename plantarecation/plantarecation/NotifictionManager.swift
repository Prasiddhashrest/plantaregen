import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    func scheduleWateringNotification(for plant: Plant) {
        let content = UNMutableNotificationContent()
        content.title = "Watering Reminder"
        content.body = "It's time to water your \(plant.name)"
        content.sound = .default

        guard let lastWateredDate = plant.lastWateredDate else { return }
        let triggerDate = lastWateredDate.addingTimeInterval(plant.wateringInterval)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: triggerDate.timeIntervalSinceNow, repeats: false)

        let request = UNNotificationRequest(identifier: plant.id.uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func cancelWateringNotification(for plant: Plant) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
}

