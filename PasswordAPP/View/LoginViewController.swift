//
//  LoginViewController.swift
//  PasswordAPP
//
//  Created by 許自翔 on 2020/11/27.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    let viewModel = LoginVM()
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func actionLogin(_ sender: Any) {
        guard let account = accountTextField.text,let password = passwordTextField.text else {
            return
        }
        
        let userLogin = User(account: account, password: password)

        viewModel.correction(user: userLogin) { [weak self] (callBack) in
            guard let self = self else {return}
            print("callBack\(callBack)")
            self.viewModel.login(i: callBack) { [weak self] (i) in
                guard let self = self else {return}
                
                switch i{
                case 1:
                   let controller = self.viewModel.alertController(controllerTitle: "錯誤訊息", message: "帳號密碼過短", okActionTitle: "確認", controllerTitleStyle: .alert, okActionStyle: .default)
                    self.present(controller, animated: true, completion: nil)
                case 2:
                    let controller = self.viewModel.alertController(controllerTitle: "錯誤訊息", message: "帳號密碼過長", okActionTitle: "確認", controllerTitleStyle: .alert, okActionStyle: .default)
                     self.present(controller, animated: true, completion: nil)
                    
                case 3:
                    self.performSegue(withIdentifier: "openView", sender: self)
                    
                case 4:
                    let controller = self.viewModel.alertController(controllerTitle: "錯誤訊息", message: "帳號密碼錯誤", okActionTitle: "確認", controllerTitleStyle: .alert, okActionStyle: .default)
                     self.present(controller, animated: true, completion: nil)
                default:
                    break
                }
                
                
            }
        }
        
        
        
        
        
        
    }
    
}
