//
//  ImageTransition.swift
//  Facebook
//
//  Created by Kelly Bryant on 6/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        //print("in presentTransition")
        
        //from instructions
        
        let tabViewController = fromViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        //let toViewController = toViewController as! PhotoViewController
        let photoViewController = toViewController as! PhotoViewController

        
        //cloning image to move it feedView as from
        let movingImageView = UIImageView()
        movingImageView.image = feedViewController.selectedImageView.image
        movingImageView.frame = feedViewController.selectedImageView.frame
        feedViewController.selectedImageView.contentMode = feedViewController.selectedImageView.contentMode
        
        movingImageView.frame.origin.y = feedViewController.selectedImageView.frame.origin.y + 110
        
        containerView.addSubview(movingImageView)
        

        //adjust aspect ratio of imageView to fit selected image
        //print(feedViewController.selectedImageView)
        if feedViewController.selectedImageView.frame.height < 156{
            //landscape images
            photoViewController.imageView.frame.size.height = 207
            photoViewController.imageView.center.y = 284
        } else if feedViewController.selectedImageView.frame.height > 156 {
            //portrait images
            photoViewController.imageView.frame.size.height = 469
            photoViewController.imageView.center.y = 284
        }
        
        
        
        
        feedViewController.selectedImageView.alpha = 0
        photoViewController.imageView.alpha = 0
        
        
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(0.8, animations: {

            toViewController.view.alpha = 1

            movingImageView.frame = photoViewController.imageView.frame
            
            }) { (finished: Bool) -> Void in

                feedViewController.selectedImageView.alpha = 1
                photoViewController.imageView.alpha = 1
                movingImageView.alpha = 0
                self.finish()
               
        }
    }
    
    

    
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
 
        
        //let feedViewController = toViewController as! NewsFeedViewController
        let tabViewController = toViewController as! UITabBarController
        let navigationController = tabViewController.selectedViewController as! UINavigationController
        let feedViewController = navigationController.topViewController as! NewsFeedViewController
        //let toViewController = toViewController as! PhotoViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        //cloning image to move it back to the feed view

        //my attempt
        let movingImageView = UIImageView()
        movingImageView.image = photoViewController.imageView.image
        movingImageView.frame = photoViewController.imageView.frame
        photoViewController.imageView.contentMode = photoViewController.imageView.contentMode
        
        
//        print("container frame y")
//        print(containerView.frame.origin.y)
//        
//        print("moving frame y")
//        print(movingImageView.frame.origin.y)
//        print("feed frame y")
//        print(feedViewController.selectedImageView.frame.origin.y)
        
        containerView.addSubview(movingImageView)
        
         //movingImageView.frame.origin.y = containerView.frame.origin.y
        


        feedViewController.selectedImageView.alpha = 1
        photoViewController.imageView.alpha = 1
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {


            movingImageView.frame = feedViewController.selectedImageView.frame
            movingImageView.alpha = 0
            
            fromViewController.view.alpha = 0
            }) { (finished: Bool) -> Void in
                feedViewController.selectedImageView.alpha = 1
                photoViewController.imageView.alpha = 0
               // movingImageView.alpha = 1
                self.finish()
        }
    }

}
