//
//  ShopViewController.swift
//  AppTwo
//
//  Created by Chapman, Emma S on 4/8/19.
//  Copyright © 2019 Chapman, Emma S. All rights reserved.
//

import UIKit


class ShopViewController: UIViewController,  UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var skinLabel: UILabel!
    
    @IBOutlet weak var ownedSkins: UILabel!
    
    @IBOutlet weak var skinPicker: UIPickerView!
    
    //var skin:String!
    
    let items = ["Red", "Blue", "Yellow", "White"]
    var selection:String!
    
    
    //picker code
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return items[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            selection = items[row]
            skinLabel.text = selection
        
    }
    //picker code end
    
    
    
    
    @IBAction func buySkin(_ sender: Any) {
        
        //stops score from going down when color is already equipped
        if (selection == "Red") && global.color == ["red"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
        else if (selection == "Blue") && global.color == ["blue"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
        else if (selection == "Yellow") && global.color == ["yellow"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
        else if (selection == "White") && global.color == ["white"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
            
        //selects color
        else if (selection == "Red") && global.score >= 10 {
            global.score = global.score - 10
            myScore.text = "Score: \(global.score)"
            ownedSkins.text = "Current Skin: " + selection
            global.color = ["red"]
            global.skin = "Red"        }
        
        else if (selection == "Blue") && global.score >= 10 {
            global.score = global.score - 10
            myScore.text = "Score: \(global.score)"
            ownedSkins.text = "Current Skin: " + selection
            global.color = ["blue"]
            global.skin = "Blue"
        }
        
        else if (selection == "Yellow") && global.score >= 10 {
            global.score = global.score - 10
            myScore.text = "Score: \(global.score)"
            ownedSkins.text = "Current Skin: " + selection
            global.color = ["yellow"]
            global.skin = "Yellow"        }
        
        else if (selection == "White") && global.score >= 10 {
            global.score = global.score - 10
            myScore.text = "Score: \(global.score)"
            ownedSkins.text = "Current Skin: " + selection
            global.color = ["white"]
            global.skin = "White"        }
        
        
     
    }
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        myScore.text = "Score: \(global.score)"
        
        if (global.color == ["white"] || global.color == ["red"] || global.color == ["blue"] || global.color == ["yellow"]) {
            ownedSkins.text = "Current Skin: " + global.skin
        }
        else {
            ownedSkins.text = "Current Skin: Default"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        skinPicker.delegate = self
        skinPicker.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
