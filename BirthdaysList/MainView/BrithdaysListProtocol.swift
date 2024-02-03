//MARK: - view protocol
protocol BrithdaysListView: AnyObject {
    
}

//MARK: - presenter protocol
protocol BrithdaysListPresenter {
    func addNewUserTapped()
    func loadUsers()
}

