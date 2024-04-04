//
//  AuthorizationView.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 1/4/24.
//

import UIKit
import SnapKit

protocol UserViewDelegate: AnyObject {
    func checkLoginButton()
}

class AuthorizationView: UIView {

    private lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text = "Welcome Back!"
        view.textColor = .label
        view.font = UIFont.boldSystemFont(ofSize: 26)
        return view
    }()
    
    private lazy var secondLabel: UILabel = {
        let view = UILabel()
        view.text = "We are exited to have you back. Log in now \nand access your account"
        view.textColor = .gray
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    private lazy var stackFields: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()

    let firstTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Name"
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.textColor = .lightGray
        view.textColor = .black
        let spacerView = UIView(frame: CGRect(x: 0, y: 0,
                                              width: 10,
                                              height: view.frame.height))
        view.leftView = spacerView
        view.leftViewMode = .always
        return view
    }()
    
    let secondTF: UITextField = {
        let view = UITextField()
        view.placeholder = "Surname"
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.textColor = .lightGray
        view.textColor = .black
        let spacerView = UIView(frame: CGRect(x: 0, y: 0,
                                              width: 10,
                                              height: view.frame.height))
        view.leftView = spacerView
        view.leftViewMode = .always
        return view
    }()
    
    private lazy var singleButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Log In", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .orange
        view.layer.cornerRadius = 5
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return view
    }()
    
    weak var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(snp.leading).offset(24)
            make.width.equalTo(336)
            make.height.equalTo(19)
        }
        
        addSubview(secondLabel)
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.leading.equalTo(snp.leading).offset(24)
            make.width.equalTo(337)
        }
        
        addSubview(stackFields)
        
        stackFields.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        
        stackFields.addArrangedSubview(firstTF)
        
        firstTF.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
        stackFields.addArrangedSubview(secondTF)
        
        secondTF.snp.makeConstraints { make in
            make.height.equalTo(55)
        }
        
       addSubview(singleButton)
        
        singleButton.snp.makeConstraints { make in
            make.top.equalTo(stackFields.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
    }

    @objc
    private func loginButtonTapped() {
        delegate?.checkLoginButton()
    }
    
}
