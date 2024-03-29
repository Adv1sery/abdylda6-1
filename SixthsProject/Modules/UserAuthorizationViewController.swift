//
//  ViewController.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 28/3/24.
//

import UIKit
import SnapKit

class UserAuthorizationViewController: UIViewController {
    
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

    private lazy var firstTF: UITextField = {
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
    
    private lazy var secondTF: UITextField = {
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
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        view.backgroundColor = .systemBackground
        
    }
    
    func setupConstraints() {
        
        view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.width.equalTo(336)
            make.height.equalTo(19)
        }
        
        view.addSubview(secondLabel)
        
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.snp.leading).offset(24)
            make.width.equalTo(337)
        }
        
        view.addSubview(stackFields)
        
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
        
        view.addSubview(singleButton)
        
        singleButton.snp.makeConstraints { make in
            make.top.equalTo(stackFields.snp.bottom).offset(50)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(50)
        }
        
    }
}

