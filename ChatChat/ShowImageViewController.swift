//
//  ShowImageViewController.swift
//  ChatChat
//
//  Created by Mark Rabins on 6/10/17.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if image != nil {
            imageView.image = image
        } else {
            print("image not found")
        }
    }
    
}
