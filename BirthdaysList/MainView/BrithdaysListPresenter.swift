import UIKit

final class DefaultBrithdaysListPresenter: BrithdaysListPresenter {
  
    //MARK: - propertis
    private unowned let view: BrithdaysListView
    private let navigationController: UINavigationController
    
    //MARK: - init
    init(view: BrithdaysListView, navigationController: UINavigationController) {
        self.view = view
        self.navigationController = navigationController
    }
    
    //MARK: - methods
    func addNewUserTapped() {
        let view = DefaultNewInfoView()
        let presenter = DefaultNewInfoPresenter(view: view, navigationController: navigationController)
        view.presenter = presenter
        navigationController.pushViewController(view, animated: true)
    }
    
    func loadUsers() {
        let operationResult = CoreDataManager.instance.loadUser()
        switch operationResult {
        case .success(let users):
            view.updateUser(users)
        case .failure(let failure):
            print(failure)
        }
    }
}
