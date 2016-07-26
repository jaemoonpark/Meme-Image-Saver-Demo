//
//  ViewController.swift
//  Meme Image Saver Demo
//
//  Created by Jaemoon Park on 7/26/16.
//  Copyright © 2016 Jaemoon Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        //hide unwanted stuff
        
        generateButton.hidden = true
        shareButton.hidden = true
        
        //====start: code heavily based off of generatedMemeImage function provided by Udacity====/
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawViewHierarchyInRect(self.view.frame,
                                     afterScreenUpdates: true)
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        generateButton.hidden = false
        shareButton.hidden = false
        //====end====/
        

        createdMeme = MyMeme.init(strTop: txtFieldTop.text!, strBottom: txtFieldBottom.text!, imageMeme: myImage.image!, memedImage: memedImage)
    }

}

