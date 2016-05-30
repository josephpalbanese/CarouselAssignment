//
//  TutorialViewController.swift
//  CarouselAssignment
//
//  Created by Joseph Perri Albanese on 5/29/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    @IBOutlet weak var tutorialPageControl: UIPageControl!
    @IBOutlet weak var startImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startImage.alpha = 0
        
        tutorialScrollView.contentSize = CGSize(width: 1280, height: 568)
        tutorialScrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(tutorialScrollView: UIScrollView) {
       
        // Get the current page of the scrollview
        var page : Int = Int(round(tutorialScrollView.contentOffset.x/320))
        
        // Set the page indicator to the screen 
        tutorialPageControl.currentPage = page
        
        if page == 3 {
            startImage.alpha = 1.0
            tutorialPageControl.hidden = true
        }
        
        else {
           startImage.alpha = 0
           tutorialPageControl.hidden = false
            
        }
        
    }
    
    @IBAction func endTutorialButton(sender: AnyObject) {
        performSegueWithIdentifier("tutorialEnd", sender: nil)
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
