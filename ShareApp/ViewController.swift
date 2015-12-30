//
//  ViewController.swift
//  ShareApp
//
//  Created by Svitlana Moiseyenko on 12/30/15.
//  Copyright © 2015 Svitlana Moiseyenko. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    
    
    
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

