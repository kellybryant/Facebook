//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Kelly Bryant on 6/16/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
   

    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var doneBtn: UIImageView!
    @IBOutlet weak var photoActions: UIImageView!
    
    var image: UIImage!
    var originalCenter: CGPoint!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
        
        
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(320, 700)
       
        doneBtn.alpha = 1
        photoActions.alpha = 1
        parentView.backgroundColor = UIColor(white: 0, alpha: 1)

        
        originalCenter = scrollView.center


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        //let point = sender.locationInView(view)
        //let velocity = sender.velocityInView(view)
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            
            
           // print("Gesture began")
        } else if sender.state == UIGestureRecognizerState.Changed {
            scrollView.center = CGPoint(x: originalCenter.x, y: originalCenter.y + translation.y)
                    UIView.animateWithDuration(0.6, animations: {
            
                        self.doneBtn.alpha = 0
                        self.photoActions.alpha = 0
                        self.parentView.backgroundColor = UIColor(white: 0, alpha: 0.6)
            
                        }) { (finished: Bool) -> Void in
                            //self.finish()
                            
                    }


            
        } else if sender.state == UIGestureRecognizerState.Ended {
            //print("Gesture ended")
            if translation.y > 100{
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                //put everything back
                //scrollView.center = CGPoint(x: originalCenter.x, y: originalCenter.y)
                UIView.animateWithDuration(0.6, animations: {
                    self.scrollView.center = CGPoint(x: self.originalCenter.x, y: self.originalCenter.y)
                    self.doneBtn.alpha = 1
                    self.photoActions.alpha = 1
                    self.parentView.backgroundColor = UIColor(white: 0, alpha: 1)
                    
                    }) { (finished: Bool) -> Void in
                        //self.finish()
                        
                }
            }

            
        }
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }

    
    

    
}
