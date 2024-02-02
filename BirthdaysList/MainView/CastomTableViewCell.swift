import UIKit

final class CastomTableViewCell: UITableViewCell {
    //MARK: - propertis
    private let contenerView = UIView()
    private let nameLabel = UILabel()
    private let surnameLable = UILabel()
    private let dateLable = UILabel()
    
    //MARK: - life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(contenerView)
        contenerView.addSubviews(nameLabel, surnameLable, dateLable)
        setupConstreints()
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        contenerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contenerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            contenerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            contenerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            contenerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            contenerView.heightAnchor.constraint(equalToConstant: 100)
        ])
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contenerView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 23)
        ])
        surnameLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            surnameLable.bottomAnchor.constraint(equalTo: contenerView.bottomAnchor, constant: -20),
            surnameLable.leadingAnchor.constraint(equalTo: contenerView.leadingAnchor, constant: 23)
        ])
        dateLable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLable.centerYAnchor.constraint(equalTo: contenerView.centerYAnchor),
            dateLable.trailingAnchor.constraint(equalTo: contenerView.trailingAnchor, constant: -23)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        contenerView.backgroundColor = .white
        contenerView.layer.cornerRadius = 15
        contentView.backgroundColor = .backgroundTableView
    }
}
