//
//  IntroViewController.swift
//  CarouselAssignment
//
//  Created by Joseph Perri Albanese on 5/26/16.
//  Copyright © 2016 jpa. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
   
    // Outlets for IntroView
    
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var introTileOne: UIImageView!
    @IBOutlet weak var introTileTwo: UIImageView!
    @IBOutlet weak var introTileThree: UIImageView!
    @IBOutlet weak var introTileFour: UIImageView!
    @IBOutlet weak var introTileFive: UIImageView!
    @IBOutlet weak var introTileSix: UIImageView!
    
    
    
    // I'm confused about why I have these variables with these values.
    
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(introScrollView.contentOffset.y)
        
        // content offset: 0 -> 568
        // x offset: -30 -> 0
        // y offset: -285 -> 0
        
        // Here is the code for my convertvalues
        
        var tileOnetx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var tileOnety = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var tileOnescale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var tileOnerotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 20, r2Max: 0)
        
        
        var tileTwotx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 75, r2Max: 0)
        var tileTwoty = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        var tileTwoscale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tileTworotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        var tileThreetx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -66, r2Max: 0)
        var tileThreety = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        var tileThreescale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var tileThreerotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tileFourtx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        var tileFourty = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var tileFourscale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var tileFourrotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tileFivetx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -160, r2Max: 0)
        var tileFivety = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        var tileFivescale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tileFiverotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        var tileSixtx = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -15, r2Max: 0)
        var tileSixty = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -460, r2Max: 0)
        var tileSixscale = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var tileSixrotation = convertValue(CGFloat(offset), r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        
        
        introTileOne.transform = CGAffineTransformMakeTranslation(CGFloat(tileOnetx), CGFloat(tileOnety))
        introTileOne.transform = CGAffineTransformScale(introTileOne.transform, CGFloat(tileOnescale), CGFloat(tileOnescale))
        introTileOne.transform = CGAffineTransformRotate(introTileOne.transform, CGFloat(Double(tileOnerotation) * M_PI / 180))
        
        introTileTwo.transform = CGAffineTransformMakeTranslation(CGFloat(tileTwotx), CGFloat(tileTwoty))
        introTileTwo.transform = CGAffineTransformScale(introTileTwo.transform, CGFloat(tileTwoscale), CGFloat(tileTwoscale))
        introTileTwo.transform = CGAffineTransformRotate(introTileTwo.transform, CGFloat(Double(tileTworotation) * M_PI / 180))

        introTileThree.transform = CGAffineTransformMakeTranslation(CGFloat(tileThreetx), CGFloat(tileThreety))
        introTileThree.transform = CGAffineTransformScale(introTileThree.transform, CGFloat(tileThreescale), CGFloat(tileThreescale))
        introTileThree.transform = CGAffineTransformRotate(introTileThree.transform, CGFloat(Double(tileThreerotation) * M_PI / 180))

        introTileFour.transform = CGAffineTransformMakeTranslation(CGFloat(tileFourtx), CGFloat(tileFourty))
        introTileFour.transform = CGAffineTransformScale(introTileFour.transform, CGFloat(tileFourscale), CGFloat(tileFourscale))
        introTileFour.transform = CGAffineTransformRotate(introTileFour.transform, CGFloat(Double(tileFourrotation) * M_PI / 180))

        introTileFive.transform = CGAffineTransformMakeTranslation(CGFloat(tileFivetx), CGFloat(tileFivety))
        introTileFive.transform = CGAffineTransformScale(introTileFive.transform, CGFloat(tileFivescale), CGFloat(tileFivescale))
        introTileFive.transform = CGAffineTransformRotate(introTileFive.transform, CGFloat(Double(tileFiverotation) * M_PI / 180))
        
        introTileSix.transform = CGAffineTransformMakeTranslation(CGFloat(tileSixtx), CGFloat(tileSixty))
        introTileSix.transform = CGAffineTransformScale(introTileSix.transform, CGFloat(tileSixscale), CGFloat(tileSixscale))
        introTileSix.transform = CGAffineTransformRotate(introTileSix.transform, CGFloat(Double(tileSixrotation) * M_PI / 180))
        


        
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
