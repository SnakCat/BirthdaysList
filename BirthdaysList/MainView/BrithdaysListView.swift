import UIKit

final class DefaultBrithdaysListView: UIViewController {
    
    //MARK: - propertis
    var presenter: BrithdaysListPresenter?
    private let tableView = UITableView()
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setupConstreints()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadUsers()
    }
    
    //MARK: - configure TableView
    private func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(CastomTableViewCell.self, forCellReuseIdentifier: "CastomTableViewCell")
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        tableView.translatesAutoresizingMaskIntoConstraints =  false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        title = NSLocalizedString("BrithdaysList", comment: "") 
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { [ weak self ] _ in
            self?.presenter?.addNewUserTapped()
        }))
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .trash)
        tableView.backgroundColor = .backgroundTableView
    }
}

    //MARK: - extension + tableView
extension DefaultBrithdaysListView: BrithdaysListView {
    
    func updateUser(_ user: [User]) {
        users = user
    }
    
}
extension DefaultBrithdaysListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastomTableViewCell", for: indexPath) as? CastomTableViewCell {
            let user = users[indexPath.row]
            cell.configure(user: user)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        if editingStyle == .delete {
            let alertDelete = UIAlertController(title: NSLocalizedString("Delete", comment: ""), message: NSLocalizedString("Delete user", comment: ""), preferredStyle: .alert)
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .default, handler: nil))
            alertDelete.addAction(UIAlertAction(title: NSLocalizedString("Delete", comment: ""), style: .destructive, handler: { _ in
                _ = CoreDataManager.instance.deleteUser(user)
                self.presenter?.loadUsers()
            }))
            present(alertDelete, animated: true)
        }
    }
}
