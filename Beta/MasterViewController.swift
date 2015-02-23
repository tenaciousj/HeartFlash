//
//  MasterViewController.swift
//  Beta
//
//  Created by Jeanette Pranin on 2/21/15.
//  Copyright (c) 2015 Jeanette Pranin. All rights reserved.
//

import UIKit
import AVFoundation

class MasterViewController: UITableViewController, YMPulseRateMeterDelegate {

    var heartBeat:YMPulseRateMater = YMPulseRateMater()
    var objects = NSMutableArray()
    let userAge = BiometricInfo()
    let defaults = NSUserDefaults.standardUserDefaults()
    let Bpm = ViewController()
    @IBOutlet weak var bpm: UILabel!
    
    @IBOutlet weak var CardioSubtitle: UILabel!
    @IBOutlet weak var FatBurnSubtitle: UILabel!
    
    @IBOutlet weak var StrengthSubtitle: UILabel!
    
    @IBOutlet weak var CoolDownSubtitle: UILabel!
    
    
    func completeWithPulseRate(pulseRate:Float) {
        println(pulseRate)
        var pulseRateAsInt:Int = Int(pulseRate)
        bpm.text = String(pulseRateAsInt) + " bpm"
        self.dismissViewControllerAnimated(true, completion: nil)
        var maxHR:Int = Int(userAge.age!)
        
        if(maxHR < 30){
            var fatNum:Int = Int(0.55*200)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*200)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*200)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*100)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 30 && maxHR < 35){
            var fatNum:Int = Int(0.55*190)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*190)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*190)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*190)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 35 && maxHR < 40){
            var fatNum:Int = Int(0.55*185)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*185)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*185)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*185)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 40 && maxHR < 45){
            var fatNum:Int = Int(0.55*180)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*180)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*180)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*180)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 45 && maxHR < 50){
            var fatNum:Int = Int(0.55*175)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*175)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*175)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*175)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 50 && maxHR < 55){
            var fatNum:Int = Int(0.55*170)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*170)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*170)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*170)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 55 && maxHR < 60){
            var fatNum:Int = Int(0.55*165)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*165)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*165)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*165)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 60 && maxHR < 65){
            var fatNum:Int = Int(0.55*160)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*160)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*160)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*160)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 65 && maxHR < 70){
            var fatNum:Int = Int(0.55*155)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*155)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*155)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*155)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }
        else if(maxHR >= 70 && maxHR <= 75){
            var fatNum:Int = Int(0.55*150)
            FatBurnSubtitle.text = "Target Heart Rate = \(fatNum) bpm"
            var cardioNum:Int = Int(0.7*150)
            CardioSubtitle.text = "Target Heart Rate = \(cardioNum) bpm"
            var strengthNum:Int = Int(0.5*150)
            StrengthSubtitle.text = "Target Heart Rate = \(strengthNum) bpm"
            var coolNum:Int = Int(0.5*150)
            CoolDownSubtitle.text = "Target Heart Rate = \(coolNum) bpm"
        }

    }

   
    
//    @IBAction func measureHeartBeat(sender: UIButton) {
//        let delay = 5*Double(NSEC_PER_SEC)
//        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
//        dispatch_after(time, dispatch_get_main_queue()){
//            self.
//        }
//    }
    func updateBPMLabel(){
        //wait 10 seconds
        //record bpm
        //update label
//        bpm.text = pm.completeWithPulseRate(self) + "bpm"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAge.age = defaults.integerForKey("age")
        println(userAge.age!)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = objects[indexPath.row] as NSDate
            (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }
    
    @IBAction func unwindToMaster(segue: UIStoryboardSegue){
        if (segue.identifier == "ageUnwind"){
            let myUDViewController = segue.sourceViewController as UserDataViewController
            userAge.age = myUDViewController.ageInt
            defaults.setInteger(userAge.age!, forKey: "age")
            //println(defaults.integerForKey("age"))
        }
    }
//    if let myVar = defaults.stringForKey("age"){
//        //code to grab myVar
//    }
    
    @IBAction func measureHeartBeat(sender: UIButton) {
        heartBeat.delegate = self
        heartBeat.start()
        
        
        
        //heartBeat.delegate.pulseRateMeterStartMeasureing!()
        //println(heartBeat.delegate)
    }
    

}

