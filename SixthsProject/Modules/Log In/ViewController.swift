//
//  ViewController.swift
//  SixthsProject
//
//  Created by Abdylda Mamashev on 1/4/24.
//

import UIKit

class ViewController: UIViewController {

    private let authorizatonView = AuthorizationView(frame: .zero)
    
    private let sessionManager = UserSessionManager.shared
    
    override func loadView() {
        super.loadView()
        view = authorizatonView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavigationItem()
        authorizatonView.delegate = self
        sessionManager.controller = self
    }
    
    private func setupNavigationItem() {
        navigationItem.title = "Log In"
    }
}

extension ViewController: UserViewDelegate {
    
    func checkLoginButton() {
        if let name = authorizatonView.firstTF.text,
           let surname = authorizatonView.secondTF.text {
            sessionManager.isSessionActive(name: name,
                                           surname: surname)
        }
    }
}

extension ViewController: UserSessionManagerProtocol {
    func successUser(with: Person) {
        let vc = UserProfileViewController()
        vc.person = with
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func failureUser() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Нет такого аккаунта",
                                      preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(acceptAction)
        present(alert, animated: true)
    }
    
}
