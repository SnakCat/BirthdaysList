final class DefaultNewInfoPresenter: NewInfoPresenter {
    //MARK: - propertis
    unowned let view: NewInfoView
    
    init(view: NewInfoView) {
        self.view = view
    }
}
