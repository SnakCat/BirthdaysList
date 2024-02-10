import UIKit
import UserNotifications

final class NotificationManager {
    
    //MARK: - singleton
    static let instance = NotificationManager()
    private init() { }
    
    //MARK: - setNitofication
    func setNotification(messege: String, id: Int, user: (String, String, String)) {
        let notificationCentr = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound]
        notificationCentr.requestAuthorization(options: options) { granted, _ in
            print("\(#function) Permissino granted: \(granted)")
            guard granted else { return }
        }
        guard let date = convertDate(date: user.2) else { return }
        let content = UNMutableNotificationContent()
        content.body = "\(user.0) \(user.1)"
        content.title = NSLocalizedString("HB", comment: "")
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.month = date.1
        dateComponents.day = date.2
        dateComponents.hour = 12
        dateComponents.minute = 00
        dateComponents.second = 00
        let triger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: "\(id)", content: content, trigger: triger)
        notificationCentr.add(request, withCompletionHandler: nil)
    }
    
    //MARK: - convert date
    private func convertDate(date: String) -> (Int, Int, Int)? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd.MM.yyyy"
        if let date = dateFormater.date(from: date) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            return (year, month, day)
        } else {
            return nil
        }
    }
    
}
    //MARK: - extension coping
extension NotificationManager: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
