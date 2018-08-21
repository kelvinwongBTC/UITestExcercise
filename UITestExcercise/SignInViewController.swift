//
//  SignInViewController.swift
//  UITestExcercise
//
//  Created by Ka Ho Wong on 21/8/18.
//  Copyright © 2018 Bigtincan. All rights reserved.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    func attempToSignIn()
}

class SignInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    weak var delegate: SignInViewControllerDelegate?
    
    @IBAction func signInButtonDidTap(_ sender: Any) {
        delegate?.attempToSignIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
