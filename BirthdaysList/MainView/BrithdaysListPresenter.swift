final class DefaultBrithdaysListPresenter: BrithdaysListPresenter {
    //MARK: - propertis
    unowned let view: BrithdaysListView
    
    //MARK: - init
    init(view: BrithdaysListView) {
        self.view = view
    }
}
