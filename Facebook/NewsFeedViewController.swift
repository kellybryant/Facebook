//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var selectedImageView: UIImageView!
   
    
    
    var fadeTransition: FadeTransition!
    var imageTransition: ImageTransition!
    
    //var window = UIApplication.sharedApplication().keyWindow
    //var frame = window.convertRect(selectedImageView.frame, fromView: view)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    
    @IBAction func onPictureTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        
        performSegueWithIdentifier("photoSegue", sender: self)

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        var photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.image = selectedImageView.image

        
        
        
        
        
        
        // Set the modal presentation style of your destinationViewController to be custom.
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        imageTransition = ImageTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        photoViewController.transitioningDelegate = fadeTransition
        
        photoViewController.transitioningDelegate = imageTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.6
        
        
        
        
        
        
    }
    


    
    
    
}
