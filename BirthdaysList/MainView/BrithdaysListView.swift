import UIKit

final class DefaultBrithdaysListView: UIViewController {
    
    //MARK: - propertis
    var presenter: BrithdaysListPresenter!
    private let tableView = UITableView()
    
    
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        setupConstreints()
        setupUI()
    }
    
    //MARK: - configure TableView
    private func configTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
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
        title = "Brithdays List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .trash)
        tableView.backgroundColor = .backgroundTableView
    }
}

    //MARK: - extension + tableView
extension DefaultBrithdaysListView: BrithdaysListView {
    
}
extension DefaultBrithdaysListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
