//
//  LoginViewController.swift
//  CarouselAssignment
//
//  Created by Joseph Perri Albanese on 5/29/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var signInScrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!

    var buttonParentViewIntialY: CGFloat!
    var signInButtonInitialY: CGFloat!
    var signInButtonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signInScrollView.delegate = self
        
        signInScrollView.contentSize = signInScrollView.frame.size
        signInScrollView.contentInset.bottom = 100
        
        // This code allows me to create events based on keyboard states
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        signInButtonInitialY = buttonParentView.frame.origin.y
        signInButtonOffset = -120
        
        // Do any additional setup after loading the view.
    
    }
    
    // This code is for one of my optional assignments.
    
    override func viewWillAppear(animated: Bool) {
        
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //Animate the code within over 0.2 seconds...
        UIView.animateWithDuration(0.2) { () -> Void in
            
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    @IBAction func backLoginButton(sender: AnyObject) {
      navigationController?.popViewControllerAnimated(true)
      print ("is this thing on")
    
    }

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // If the scrollView has been scrolled down by 50px or more...
        if scrollView.contentOffset.y <= -10 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    
    
    func keyboardWillShow(notification: NSNotification!) {
        print ("Hello?")
        buttonParentView.frame.origin.y = signInButtonInitialY + signInButtonOffset
        signInScrollView.contentOffset.y = signInScrollView.contentInset.bottom
        
    
    }
    
    
    
    
    func keyboardWillHide(notification: NSNotification!) {
        
        // Move the buttons back down to it's original positio
        buttonParentView.frame.origin.y = signInButtonInitialY

    
    }
    
    
    // Here is my log in/sign up code
    
    @IBAction func signinTapped(sender: AnyObject) {
        
        // This is my code for empty textfields
      
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            signinIndicator.startAnimating()
            delay(0.5, closure: { 
                
                self.signinIndicator.stopAnimating()
                
                let emptyAlertController = UIAlertController(title: "Oops!", message: "Email or Password field is empty", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
                emptyAlertController.addAction(cancelAction)
                
                self.presentViewController(emptyAlertController, animated: true, completion: nil)
                
            })
        }
        
        else {
        
            
            // If both text fields have input, this method runs.
            
            if emailTextField.text == "josephpalbanese@gmail.com" && passwordTextField.text == "facebook"{
                signinIndicator.startAnimating()
                delay(2.0, closure: {
                    self.signinIndicator.stopAnimating()
                    self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                })
            }
                
            else {
                signinIndicator.startAnimating()
                delay(2.0, closure: {
                    
                    self.signinIndicator.stopAnimating()
                    
                    let errorAlertController = UIAlertController(title: "Oops!", message: "Incorrect Email/Password combination.", preferredStyle: .Alert)
                    let errorCancelAction = UIAlertAction(title: "Okay", style: .Cancel, handler: nil)
                    errorAlertController.addAction(errorCancelAction)
                    
                    self.presentViewController(errorAlertController, animated: true, completion: nil)
                })
            }
        }
        }
            

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
