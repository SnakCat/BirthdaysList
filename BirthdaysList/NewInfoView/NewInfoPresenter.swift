import UIKit
import CoreData

final class DefaultNewInfoPresenter: NewInfoPresenter {
  
    //MARK: - propertis
    private unowned let view: NewInfoView
    private let navigationController: UINavigationController
    
    //MARK: - init
    init(view: NewInfoView, navigationController: UINavigationController) {
        self.view = view
        self.navigationController = navigationController
    }
    
    //MARK: - methods
    func saveUsers(date: String, name: String, surname: String) {
        let result = CoreDataManager.instance.saveUser(date: date, name: name, surname: surname)
        switch result {
        case .success:
            let alertSuccess = UIAlertController(title: "Save", message: "new user append", preferredStyle: .alert)
            alertSuccess.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            }))
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            do {
                let count = try context.count(for: fetchRequest)
                NotificationManager.instance.setNotification(messege: "Messege", id: count, user: (name, surname, date))
            } catch let error as NSError {
                print("\(error) \(error.userInfo)")
            }
        case .failure:
            let alertFailure = UIAlertController(title: "Error", message: "error is append", preferredStyle: .alert)
            alertFailure.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { _ in
            }))
        }
    }
}
