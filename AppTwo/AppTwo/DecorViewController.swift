//
//  DecorViewController.swift
//  AppTwo
//
//  Created by Chapman, Emma S on 4/11/19.
//  Copyright © 2019 Chapman, Emma S. All rights reserved.
//

import UIKit

class DecorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var decorLabel: UILabel!
    
    @IBOutlet weak var decorPicker: UIPickerView!
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var treeLabel: UILabel!
    
    @IBOutlet weak var flowerLabel: UILabel!
    
    @IBOutlet weak var birdLabel: UILabel!
    
    
    
    let decor = ["Tree", "Flower", "Bird"]
    var decoration:String!
    
    
    //picker code
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return decor.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return decor[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        decoration = decor[row]
        decorLabel.text = decoration
        
    }
    //picker code end
    
    
    @IBAction func buyDecor(_ sender: Any) {
        
        //stops score from going down if decoration is already equipped
        if (decoration == "Tree") && global.tree == ["tree"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
        else if (decoration == "Flower") && global.flower == ["flower"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
        else if (decoration == "Bird") && global.bird == ["bird"] {
            global.score = global.score + 0
            myScore.text = "Score: \(global.score)"
        }
            
        //selects decoration
        else if (decoration == "Tree") && global.score >= 20 {
            global.score = global.score - 20
            myScore.text = "Score: \(global.score)"
            global.tree = ["tree"]
            treeLabel.isHidden = false
        }
        else if (decoration == "Flower") && global.score >= 20 {
            global.score = global.score - 20
            myScore.text = "Score: \(global.score)"
            global.flower = ["flower"]
            flowerLabel.isHidden = false
        }
        else if (decoration == "Bird") && global.score >= 20 {
            global.score = global.score - 20
            myScore.text = "Score: \(global.score)"
            global.bird = ["bird"]
            birdLabel.isHidden = false
        }
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        myScore.text = "Score: \(global.score)"
        
        if (global.tree == ["tree"]) {
            treeLabel.isHidden = false
        }
        else {
            treeLabel.isHidden = true
        }
        if (global.flower == ["flower"]) {
            flowerLabel.isHidden = false
        }
        else {
            flowerLabel.isHidden = true
        }
        if (global.bird == ["bird"]) {
            birdLabel.isHidden = false
        }
        else {
            birdLabel.isHidden = true
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        decorPicker.delegate = self
        decorPicker.dataSource = self

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
