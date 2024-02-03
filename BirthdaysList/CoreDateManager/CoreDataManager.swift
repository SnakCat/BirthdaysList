import CoreData
import UIKit.UIApplication

    //MARK: - error
enum CoreDataError: Error {
    case error(String)
}

    //MARK: - manager coreData
final class CoreDataManager {
    
    //MARK: - singletone
    static let instance = CoreDataManager()
    private init() { }
    
    //MARK: - save method
    func saveUser(date: String, name: String, surname: String) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managerContext)!
        let user = NSManagedObject(entity: entity, insertInto: managerContext)
        
        user.setValue(date, forKey: "date")
        user.setValue(name, forKey: "name")
        user.setValue(surname, forKey: "surname")
        
        do {
            try managerContext.save()
            return .success(())
        } catch {
            return .failure(.error("Cloud not save \(error)"))
        }
    }
    //MARK: - load method
    func loadUser() -> Result<[User], CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        
        do {
            let object = try managerContext.fetch(fetchRequest)
            return .success(object)
        } catch {
            return .failure(.error("Cloud not save \(error)"))
        }
    }
    
    //MARK: - delete method
    func deleteUser(_ user: User) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelagate not found"))
        }
        let managerContext = appDelegate.persistentContainer.viewContext
        do {
            managerContext.delete(user)
            try managerContext.save()
            return .success(())
        } catch {
            return .failure(.error("Error delegate user \(error)"))
        }
    }
}

