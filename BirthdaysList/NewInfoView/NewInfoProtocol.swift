//MARK: - view protocol
protocol NewInfoView: AnyObject {
    
}

//MARK: - presenter protocol
protocol NewInfoPresenter {
    func saveUsers(date: String, name: String, surname: String)
}
