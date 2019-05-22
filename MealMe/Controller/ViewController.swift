//
//  ViewController.swift
//  MealMe
//
//  Created by Ahmed ibrahim on 5/16/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gimmeButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gimmeButtonPressed.layer.cornerRadius = 20
    }
    
    @IBAction func gimmeButtonPressed(_ sender: UIButton) {
        print("GIMME pressed!")
    }
    
}

