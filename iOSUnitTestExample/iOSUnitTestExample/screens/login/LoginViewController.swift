//
//  LoginViewController.swift
//  iOSUnitTestSample
//
//  Created by Phạm Như Vũ on 5/19/18.
//  Copyright © 2018 Phạm Như Vũ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    public func setViewModel(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfEmail.placeholder = "Email"
        tfPassword.placeholder = "Password"

        btnLogin.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
        btnRegister.addTarget(self, action: #selector(click(sender:)), for: .touchUpInside)
    }
    
    @objc func click(sender: UIButton) {
        switch sender.tag {
        case btnLogin.tag:
            navigationController?.pushViewController(MainViewController(), animated: true)
        default:
            return
        }
    }
}
