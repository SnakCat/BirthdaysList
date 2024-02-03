//MARK: - view protocol
protocol NewInfoView: AnyObject {
    
}

//MARK: - presenter protocol
protocol NewInfoPresenter {
    func saveUser(date: String, name: String, surname: String)
}
