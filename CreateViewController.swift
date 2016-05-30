//
//  CreateViewController.swift
//  CarouselAssignment
//
//  Created by Joseph Perri Albanese on 5/30/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {


    @IBOutlet weak var termsAgreeButton: UIButton!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var createScrollView: UIScrollView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        createScrollView.delegate = self
        
        // createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 60

        
        
        // This code allows me to create actions off keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func keyboardWillShow(notification: NSNotification!) {
        print ("Hello?")
        
        buttonParentView.frame.origin.y = 286
        createScrollView.contentOffset.y = createScrollView.contentInset.bottom
        
        
    }
    
    @IBAction func termsButtonTapped(sender: AnyObject) {
        termsAgreeButton.selected = !termsAgreeButton.selected
        
    }


    
    
    
    func keyboardWillHide(notification: NSNotification!) {
        
        // Move the buttons back down to it's original positio
        // buttonParentView.frame.origin.y = signInButtonInitialY
        
        
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
