import UIKit

final class DefaultNewInfoPresenter: NewInfoPresenter {
    
    //MARK: - propertis
    unowned let view: NewInfoView
    private let navigationController: UINavigationController
    
    //MARK: - init
    init(view: NewInfoView, navigationController: UINavigationController) {
        self.view = view
        self.navigationController = navigationController
    }
}
