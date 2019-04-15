//
//  ViewController.swift
//  AppTwo
//
//  Created by Chapman, Emma S on 4/3/19.
//  Copyright © 2019 Chapman, Emma S. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var skinLabel: UILabel!
    
    @IBAction func fullReset(_ sender: Any) {
        global.score = 0
        global.color = ["default"]
        global.tree = ["none"]
        global.flower = ["none"]
        global.bird = ["none"]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

