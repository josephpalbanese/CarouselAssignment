//
//  TimelineViewController.swift
//  CarouselAssignment
//
//  Created by Joseph Perri Albanese on 5/30/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        feedScrollView.contentSize = feedImageView.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func conversationTapped(sender: AnyObject) {
        performSegueWithIdentifier("conversationSegue", sender: nil)
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
