//
//  GameViewController.swift
//  AppTwo
//
//  Created by Chapman, Emma S on 4/8/19.
//  Copyright © 2019 Chapman, Emma S. All rights reserved.
//

import UIKit

class Global {
    var score: Int = 0
    var color = ["red", "blue", "yellow", "white", "default"]
    var skin:String!
    var tree = ["tree", "none"]
    var flower = ["flower", "none"]
    var bird = ["bird", "none"]
}
let global = Global ()

class GameViewController: UIViewController {
    
    //var score: Int = 0
    var need: Int = 0
    var counter: Int = 30
    var timer = Timer()
    var isTimerRunning:Bool = false
    var chars:Int = Int(arc4random_uniform(4) + 0)
    
    @IBOutlet weak var treeImage: UIImageView!
    
    @IBOutlet weak var flowerImage: UIImageView!
    
    @IBOutlet weak var birdImage: UIImageView!
    
    @IBOutlet weak var myScore: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mySubmit: UIButton!
    
    @IBOutlet weak var petName: UITextField!
    
    @IBOutlet weak var petNeed: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var petImage: UIImageView!
    
    var cat: UIImage!
    
    //testing color
    
    @IBAction func submitName(_ sender: Any) {
        
        let name = petName.text!
        nameLabel.text = "\(name)"
        
        petName.resignFirstResponder()
        
        chars = Int(arc4random_uniform(4) + 0)
        if isTimerRunning == false {
            runTimer()
        }
        
        petName.isHidden = true
        mySubmit.isHidden = true
        petNeed.isHidden = false
    }
    
    @IBAction func needSubmit(_ sender: Any) {
        
        //default if correct random number is not selected
        if global.color == ["red"] {
            petImage.image = UIImage(named: "angryred")
        }
        else if global.color == ["blue"] {
            petImage.image = UIImage(named: "angrylightblue")
        }
        else if global.color == ["yellow"] {
            petImage.image = UIImage(named: "angryyellow")
        }
        //color on first load and full reset
        else {
            petImage.image = UIImage(named: "angrywhite")

        }
        
        
        if (need == chars) {
            global.score = global.score + 5
            myScore.text = "Score: \(global.score)"
            chars = Int(arc4random_uniform(4) + 0)
            petImage.image = cat
        }
        
            
        else {
            // updates score w/out adding anything to score. Does not regen random number.
            myScore.text = "Score: \(global.score)"        }
        
    }
    
    
    @IBAction func needSlider(_ sender: UISlider) {
        
        need = Int(sender.value)
        if (need == 0) {
            
            petNeed.setTitle("Feed", for: .normal)
        }
        else if (need == 1){
            petNeed.setTitle("Wash", for: .normal)
        }
        else if (need == 2){
            petNeed.setTitle("Pet", for: .normal)
        }
        else if (need == 3){
            petNeed.setTitle("Walk", for: .normal)
        }
        
    }
    
    //timer code
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        
    }
    
    @objc func updateTimer() {
        counter -= 1
        timerLabel.text = "\(counter)"
        if(counter == 0) {
            timerLabel.text = "Time's Up!"
            timer.invalidate()
            
            petNeed.isHidden = true
        }
    }
    //end timer code
    
    @IBAction func myReset(_ sender: Any) {
        
        
        myScore.text = "Score: \(global.score)"
        timer.invalidate()
        counter = 30
        timerLabel.text = "Timer"
        isTimerRunning = false
        petNeed.isHidden = false
        nameLabel.text = "Name your pet!"
        petName.text = ""
        petName.isHidden = false
        mySubmit.isHidden = false
        petNeed.isHidden = true
        petImage.image = cat
    }
    
    // view will appear code
    override func viewWillAppear(_ animated: Bool) {
        
        myScore.text = "Score: \(global.score)"
        
        if (global.color == ["red"]) {
            cat = UIImage(named: "redcat")
        }
        
        else if (global.color == ["blue"]) {
            cat = UIImage(named: "lightbluecat")        }
        
        else if (global.color == ["yellow"]) {
            cat = UIImage(named: "yellowcat")        }
        
        else if (global.color == ["white"]) {
            cat = UIImage(named: "whitecat")
        }
        //color on first load and full reset
        else {
            cat = UIImage(named: "whitecat")        }
        
        petImage.image = cat
        
        // tree image
        if (global.tree == ["tree"]) {
            treeImage.isHidden = false
        }
        else {
            treeImage.isHidden = true
        }
        
        // flower image
        if (global.flower == ["flower"]) {
            flowerImage.isHidden = false
        }
        else {
            flowerImage.isHidden = true
        }
        
        // bird image
        if (global.bird == ["bird"]) {
            birdImage.isHidden = false
        }
        else {
            birdImage.isHidden = true
        }
        
    }
    // end viewWillAppear code
    


    override func viewDidLoad() {
        super.viewDidLoad()
        petNeed.isHidden = true
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
