import UIKit

final class DefaultBrithdaysListPresenter: BrithdaysListPresenter {

    //MARK: - propertis
    unowned let view: BrithdaysListView
    private let navigationController: UINavigationController
    
    //MARK: - init
    init(view: BrithdaysListView, navigationController: UINavigationController) {
        self.view = view
        self.navigationController = navigationController
    }
    
    //MARK: - methods
    func addNewUserTapped() {
        let addNewView = DefaultNewInfoView()
        navigationController.pushViewController(addNewView, animated: true)
    }
}
