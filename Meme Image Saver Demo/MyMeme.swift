//
//  MyMeme.swift
//  Meme Image Saver Demo
//
//  Created by Jaemoon Park on 7/26/16.
//  Copyright © 2016 Jaemoon Park. All rights reserved.
//

import Foundation
import UIKit
struct MyMeme{
    var strTop: String
    var strBottom: String
    var imageMeme: UIImage
    var memedImage: UIImage
    
    init(strTop: String, strBottom: String, imageMeme: UIImage, memedImage: UIImage){
        self.strTop = strTop
        self.strBottom = strBottom
        self.imageMeme = imageMeme
        self.memedImage = memedImage
    }
    
}

