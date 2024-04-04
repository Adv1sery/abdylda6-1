//
//  UserProfileViewController.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 2/4/24.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var person: Person?
    
    private let userProfileView = UserProfileView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        userProfileView.delegate = self
        updateUserLabels()
    }
    
    private func updateUserLabels() {
        guard let person = person else {
            return
        }
        
        userProfileView.updateLabel(with: person)
        
    }
}

extension UserProfileViewController: UserProfileViewProtocol {
    
}
    
