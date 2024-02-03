import UIKit

final class DefaultNewInfoView: UIViewController {
    //MARK: - propertis
    var presenter: NewInfoPresenter!
    private let titleLeble = UILabel()
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let datePicker = UIDatePicker()
    private let dateTextField = UITextField()
    private let saveButton = UIButton()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(titleLeble, nameTextField, surnameTextField, datePicker, saveButton)
        setupConstreints()
        setupUI()
    }
    
    //MARK: - constreints
    private func setupConstreints() {
        titleLeble.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLeble.topAnchor.constraint(equalTo: view.topAnchor, constant: 165),
            titleLeble.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: titleLeble.bottomAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        surnameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            surnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            surnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            surnameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            datePicker.heightAnchor.constraint(equalToConstant: 190)
        ])
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 30),
            saveButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    //MARK: - UI
    private func setupUI() {
        view.backgroundColor = .backgroundTableView
        title = "New Info"
        
        titleLeble.text = "Enter some information below:"
        titleLeble.textAlignment = .center
        
        nameTextField.placeholder = "Name"
        nameTextField.textAlignment = .center
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 15
        
        surnameTextField.placeholder = "Surname"
        surnameTextField.textAlignment = .center
        surnameTextField.backgroundColor = .white
        surnameTextField.layer.cornerRadius = 15
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        saveButton.backgroundColor = .systemBlue
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 15
            
    }
}
    //MARK: - extension
extension DefaultNewInfoView: NewInfoView {
    
}
