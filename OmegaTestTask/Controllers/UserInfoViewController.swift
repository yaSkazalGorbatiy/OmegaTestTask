//
//  UserInfoViewController.swift
//  OmegaTestTask
//
//  Created by Сергей Горбачёв on 03.10.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    private let firstNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setModel()
    }
    
    private func setupViews() {
        title = "Active User"
        view.backgroundColor = .white

        stackView = UIStackView(arrangedSubviews: [firstNameLabel,
                                                   secondNameLabel,
                                                   ageLabel,
                                                   phoneLabel,
                                                   emailLabel,
                                                   passwordLabel],
                                axis: .vertical,
                                spacing: 10,
                                distribution: .fillProportionally)
        
        view.addSubview(stackView)
    }
    
    private func setModel() {
        guard let activeUser = DataBase.shared.activeUser else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: activeUser.age)
        
        firstNameLabel.text = activeUser.firstName
        secondNameLabel.text = activeUser.secondName
        ageLabel.text = dateString
        phoneLabel.text = activeUser.phone
        emailLabel.text = activeUser.email
        passwordLabel.text = activeUser.password
    }
}

//MARK: - SetConstraints

extension UserInfoViewController {
    
    private func setConstraints() {

        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


