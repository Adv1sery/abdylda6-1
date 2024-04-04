//
//  UserProfileView.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 2/4/24.
//

import UIKit
import SnapKit

protocol UserProfileViewProtocol: AnyObject {}

class UserProfileView: UIView {

    private let nameLabel = UILabel()
    private let surnameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let dateLabel = UILabel()
    
    weak var delegate: UserProfileViewProtocol?
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLabel(with: Person) {
      
        nameLabel.text = with.name
        surnameLabel.text = with.surname
        phoneLabel.text = with.phone
        
    }
    
    private func setupConstraints() {
        
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalToSuperview()
        }
        
        addSubview(surnameLabel)
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(surnameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
