//
//  ViewController.swift
//  Meme Image Saver Demo
//
//  Created by Jaemoon Park on 7/26/16.
//  Copyright © 2016 Jaemoon Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var txtFieldTop: UITextField!
    @IBOutlet weak var txtFieldBottom: UITextField!
    @IBOutlet weak var myImage: UIImageView!
    var createdMeme: MyMeme!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //source:Udacity
    @IBAction func saveMeme()
    {
    
        //storing original bounds
        let tempImageBound = myImage.bounds
        let tempTopTxtBound = txtFieldTop.bounds
        let tempBtmTxtBound = txtFieldBottom.bounds
        
        //setting up bounds for meme capture
        let rectImage = CGRectMake(0, 0, myImage.image!.size.width, myImage.image!.size.height)
        let rectTopText = CGRectMake(0.0, 0.0, myImage.image!.size.width, txtFieldTop.bounds.size.height)
        let rectBotText = CGRectMake(0.0, rectImage.size.height - txtFieldBottom.bounds.size.height, myImage.image!.size.width, txtFieldBottom.bounds.size.height)
        
        //readjusting image bounds to scale objects properly
        myImage.bounds = rectImage
        txtFieldTop.bounds = rectTopText
        txtFieldBottom.bounds = rectBotText
        
        //drawing all three images
        UIGraphicsBeginImageContextWithOptions(myImage.frame.size, false, 0.0)
        myImage.drawViewHierarchyInRect(rectImage, afterScreenUpdates: true)
        txtFieldTop.drawViewHierarchyInRect(rectTopText, afterScreenUpdates: true)
        txtFieldBottom.drawViewHierarchyInRect(rectBotText, afterScreenUpdates: true)
        
        //saving created meme image
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        //restoring original bounds
        myImage.bounds = tempImageBound
        txtFieldTop.bounds = tempTopTxtBound
        txtFieldBottom.bounds = tempBtmTxtBound
        
        
        
        
        //passing meme into activity view
        let activityView = UIActivityViewController.init(activityItems: [memedImage], applicationActivities: nil)
        self.presentViewController(activityView, animated: true, completion: nil)
    }

}

