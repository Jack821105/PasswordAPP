//
//  LoginViewModel.swift
//  PasswordAPP
//
//  Created by 許自翔 on 2020/11/27.
//

import Foundation
import UIKit

protocol LoginViewModel {
    
    
    var userLoginVM:User { get }
    
    func correction(user:User?,callBack:@escaping ([String:Int]) -> Void)
    
    func login(i: [String:Int]?,callBack:@escaping (Int) -> Void)
    
    func alertController(controllerTitle:String,message:String,okActionTitle:String,controllerTitleStyle:UIAlertController.Style,okActionStyle:UIAlertAction.Style) -> UIAlertController
}

class LoginVM:LoginViewModel{
    
    func alertController(controllerTitle: String, message: String, okActionTitle: String, controllerTitleStyle: UIAlertController.Style, okActionStyle: UIAlertAction.Style) -> UIAlertController {
        let controller = UIAlertController(title: controllerTitle, message: message, preferredStyle: controllerTitleStyle)
          let okAction = UIAlertAction(title: okActionTitle, style: okActionStyle, handler: nil)
          controller.addAction(okAction)
        
        return controller
    }
    
    let userLoginVM = User(account: "kobe81", password: "123456")
    
    func login(i: [String : Int]?, callBack: @escaping (Int) -> Void) {
        guard let i = i else {
            return
        }
        
        switch i["result"] {
        case 1:
            callBack(1)
        case 2:
            callBack(2)
        case 3:
            callBack(3)
        default:
            callBack(4)
        }
    }
    
    
    
    func correction(user: User?, callBack: @escaping ([String : Int]) -> Void) {
        guard let inUser = user else {
            return
        }
        
        if inUser.account.count < 4 || inUser.password.count < 4{
            callBack(["result":1])
        }else if inUser.account.count > 10 || inUser.password.count > 10 {
            callBack(["result":2])
        }else{
            if userLoginVM.account == inUser.account{
                if userLoginVM.password == inUser
                    .password{
                    print("password\(inUser.password)\n\(userLoginVM.password)")
                    callBack(["result":3])
                }else{
                    callBack(["result":4])
                }
            }else{
                callBack(["result":4])
            }
        }
        
    }
    
    
    
    
    
    
}
