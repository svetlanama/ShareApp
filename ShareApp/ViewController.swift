//
//  ViewController.swift
//  ShareApp
//
//  Created by Svitlana Moiseyenko on 12/30/15.
//  Copyright © 2015 Svitlana Moiseyenko. All rights reserved.
//

import UIKit
import Social


class ViewController: UIViewController, UIDocumentInteractionControllerDelegate {
    
    private var documentController:UIDocumentInteractionController!
    
    @IBAction func shareOnFb(sender: AnyObject) {
        
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText("Look at this great picture!")
        let img = UIImage(named: "newyear_morefun");
        vc.addImage(img!)
        //vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func shareOnTwitter(sender: AnyObject) {
        
        
        let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        vc.setInitialText("Look at this great picture!")
        let img = UIImage(named: "newyear_morefun");
        vc.addImage(img!)
        //vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func shareOnInstagramm(sender: AnyObject) {
        
       let img = UIImage(named: "newyear_morefun")
        
//        if (MGInstagram. isAppInstalled] && [MGInstagram isImageCorrectSize:image]) {
//            [self.instagram postImage:image inView:self.view];
//        }
//        else {
//            NSLog(@"Error Instagram is either not installed or image is incorrect size");
//        }
        
        
        let instagramUrl = NSURL(string: "instagram://app")
        if(UIApplication.sharedApplication().canOpenURL(instagramUrl!)){
            
            //Instagram App avaible
            
            let imageData = UIImageJPEGRepresentation(img!, 100)
            let captionString = "Your Caption"
            let writePath = (NSTemporaryDirectory() as NSString).stringByAppendingPathComponent("instagram.igo")
            
            if(!imageData!.writeToFile(writePath, atomically: true)){
                //Fail to write. Don't post it
                return
            } else{
                //Safe to post
                
                let fileURL = NSURL(fileURLWithPath: writePath)
                self.documentController = UIDocumentInteractionController(URL: fileURL)
                self.documentController.delegate = self
                self.documentController.UTI = "com.instagram.exclusivegram"
                self.documentController.annotation =  NSDictionary(object: captionString, forKey: "InstagramCaption")
                self.documentController.presentOpenInMenuFromRect(self.view.frame, inView: self.view, animated: true)
            }
        } else {
            //Instagram App NOT avaible...
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

