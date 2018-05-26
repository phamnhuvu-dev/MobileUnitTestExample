//
//  LoginViewController.swift
//  iOSUnitTestSample
//
//  Created by Phạm Như Vũ on 5/19/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit
import RxSwift

class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModel!
    private var disposeBag: DisposeBag = DisposeBag()
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    public func setViewModel(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.accessibilityIdentifier = "tfEmail"
        tfPassword.accessibilityIdentifier = "tfPassword"
        btnLogin.accessibilityIdentifier = "btnLogin"
        
        tfEmail.placeholder = "Email"
        tfPassword.placeholder = "Password"

        btnLogin.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        btnRegister.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
    }
    
    @objc func click(sender: UIButton) {
        switch sender.tag {
        case btnLogin.tag:
            let email = tfEmail.text!
            let password = tfPassword.text!
            viewModel.login(email: email, password: password)
                .subscribe(
                    onNext: { message in
                        switch (message) {
                        case .EMPTY_EMAIL:
                            self.tfEmail.text = ""
                            self.tfEmail.placeholder = "Empty Email"
                            
                        case .INVALID_EMAIL:
                            self.tfEmail.text = ""
                            self.tfEmail.placeholder = "Invalid Email"
                            
                        case .EMPTY_PASSWORD:
                            self.tfPassword.text = ""
                            self.tfPassword.placeholder = "Empty Password"
                            
                        case .SHORT_PASSWORD:
                            self.tfPassword.text = ""
                            self.tfPassword.placeholder = "Short Password"
                        }
                },
                    onError: { error in },
                    onCompleted: { () in
                        self.navigationController?.pushViewController(MainViewController(), animated: true)
                }).disposed(by: self.disposeBag)
        default:
            return
        }
    }
}
