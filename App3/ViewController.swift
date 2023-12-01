//
//  ViewController.swift
//  App3
//
//  Created by christopher conyersIV on 11/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

