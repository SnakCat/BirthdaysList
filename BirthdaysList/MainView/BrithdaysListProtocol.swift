//MARK: - view protocol
protocol BrithdaysListView: AnyObject {
    func updateUser(_ user: [User])
}

//MARK: - presenter protocol
protocol BrithdaysListPresenter {
    func addNewUserTapped()
    func loadUsers()
}

