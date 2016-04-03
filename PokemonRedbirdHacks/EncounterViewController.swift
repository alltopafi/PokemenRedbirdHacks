//
//  EncounterViewController.swift
//  PokemonRedbirdHacks
//
//  Created by Jesse Alltop on 4/2/16.
//  Copyright © 2016 Jesse Alltop. All rights reserved.
//

import Foundation
import UIKit

class EncounterViewController: UIViewController{
    var catchRate:Int = 60
    var fleeRate:Int = 30
    var randomFlee = arc4random()%100 + 1
    var randomNumInt = arc4random()%100 + 1
    var dataPassed:String!
    var locationString:String = ""
    var caught:Bool = false

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var throwView: UIImageView!

    @IBAction func pokeball(sender: AnyObject) {
        caught = true
        switch(locationString){
        case "everest":
            //print("random is: ",Int(randomNumInt))
            if(Int(randomNumInt)<=catchRate){
                savePokemon("Articuno", caught: true)
                displayAlert("Catch 'em All", error: "Articuno was caught!")
            }else{
                print("catch num: ", randomNumInt)
                randomNumInt = arc4random()%100
                if(Int(randomFlee)<=fleeRate)
                {
                    displayAlert("Whoops!",error: "Articuno got away.")
                }
                Alert.Warning(self, message: "Articuno was not caught.")
            }
            break;
        case "pompeii":
            if(Int(randomNumInt)<=catchRate){
                savePokemon("Moltres", caught: true)
                displayAlert("Catch 'em All", error: "Moltres was caught!")
            }else{
                print("catch num: ", randomNumInt)
                randomNumInt = arc4random()%100
                if(Int(randomFlee)<=fleeRate)
                {
                    displayAlert("Whoops!",error: "Moltres got away.")
                }
                Alert.Warning(self, message: "Moltres was not caught.")
            }
            break;
        case "japan":
            if(Int(randomNumInt)<=catchRate*2){
                savePokemon("GoldenDragonPirate", caught: true)
                displayAlert("Catch 'em All", error: "GoldenDragonPirate was caught!")
            }else{
                print("catch num: ", randomNumInt)
                randomNumInt = arc4random()%100
                if(Int(randomFlee)<=fleeRate)
                {
                    displayAlert("Whoops!",error: "GoldenDragonPirate got away.")
                }
                Alert.Warning(self, message: "GoldenDragonPirate was not caught.")
            }
            break;
        case "quad":
            if(Int(randomNumInt)<=catchRate/2){
                savePokemon("Snorlax", caught: true)
                displayAlert("Catch 'em All", error: "Snorlax was caught!")
            }else{
                print("catch num: ", randomNumInt)
                randomNumInt = arc4random()%100
                if(Int(randomFlee)<=fleeRate)
                {
                    displayAlert("Whoops!",error: "Snorlax got away.")
                }
                Alert.Warning(self, message: "Snorlax was not caught.")
            }
            break;
            
        default:
            break;
        }
        
        //transition back to map
        

    }
    
    @IBAction func runButton(sender: AnyObject) {
        displayAlert("Flee!",error: "You got away!")
        
    }
    
    @IBAction func throwRockButton(sender: AnyObject) {
    
        throwView.animationImages = [
            UIImage(named: "images/rock1.png")!,
            UIImage(named: "images/rock2.png")!,
            UIImage(named: "images/rock3.png")!
        ]
        
        throwView.animationDuration = 2
        throwView.animationRepeatCount = 1
        throwView.startAnimating()
       
        catchRate = catchRate + 10
        fleeRate = fleeRate + 5
        randomFlee = arc4random()%100 + 1
        print("rock throw flee: ",Int(randomFlee))
        if(Int(randomFlee)<=fleeRate)
        {
            
            switch locationString {
            case "everest":
                displayAlert("Whoops!", error: "Sorry Articuno got away.")
                break;
            case "pompeii":
                displayAlert("Whoops!", error: "Sorry Moltres got away.")
                break;
            case "japan":
                displayAlert("Whoops!", error: "Sorry GoldenDragonPirate got away.")
                break;
            case "quad":
                displayAlert("Whoops!", error: "Sorry Snorlax got away.")
                break;
                
            default:
                break;
            }
            
            
        }

        
        
        
    }
    
    @IBAction func baitButton(sender: AnyObject) {
        
        
        throwView.animationImages = [
            UIImage(named: "images/food1.png")!,
            UIImage(named: "images/food2.png")!,
            UIImage(named: "images/food3.png")!
        ]
        
        throwView.animationDuration = 2
        throwView.animationRepeatCount = 1
        throwView.startAnimating()
        
        
        catchRate = catchRate - 10
        fleeRate = fleeRate - 5
        randomFlee = arc4random()%100 + 1
        print("fleeRate is: ",fleeRate)
        print("roll is: ",Int(randomFlee))
       
        if(Int(randomFlee)<=fleeRate)
        {
            
            switch (locationString) {
            case "everest":
                displayAlert("Whoops!", error: "Sorry Articuno got away.")
                break;
            case "pompeii":
                displayAlert("Whoops!", error: "Sorry Moltres got away.")
                break;
            case "japan":
                displayAlert("Whoops!", error: "Sorry GoldenDragonPirate got away.")
                break;
            case "quad":
                displayAlert("Whoops!", error: "Sorry Snorlax got away.")
                break;
                
            default:
                break;
            }
            
            
        }


    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       // locationString=dataPassed
        //print(dataPassed)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(locationString)
        
        switch locationString {
        case "everest":
            imageView.image=UIImage(named: "everest")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "images/backgroundEverest.png")!)
            break;
        case "pompeii":
            imageView.image=UIImage(named: "pompeii")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "images/backgroundPompeii.png")!)
            break;
        case "japan":
            imageView.image=UIImage(named: "japan")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "images/backgroundJapan.png")!)
            break;
        case "quad":
            imageView.image=UIImage(named: "quad")
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "images/backgroundQuad.png")!)
            break;
            
        default:
            break;
        }
        
        
        
        if(caught)
        {
            switch(locationString){
            case "everest":
                savePokemon("Articuno", caught: true)
                break;
            case "pompeii":
                savePokemon("Moltres", caught: true)
                break;
            case "japan":
                savePokemon("GoldenDragonPirate", caught: true)
                break;
            case "quad":
                savePokemon("Snorlax", caught: true)
                break;
                
            default:
                break;
            }
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    func savePokemon(name:String, caught:Bool){
        let newPoke = pokemon(name: name,caught: caught)
        let pokemonData = NSUserDefaults.standardUserDefaults().objectForKey("pokemon") as? NSData
        
        if let pokemonData = pokemonData {
            var pokemonArray = NSKeyedUnarchiver.unarchiveObjectWithData(pokemonData) as? [pokemon]
            pokemonArray?.append(newPoke)
            let pokemonArray2 = NSKeyedArchiver.archivedDataWithRootObject(pokemonArray!)
            NSUserDefaults.standardUserDefaults().setObject(pokemonArray2, forKey: "pokemon")
            NSUserDefaults.standardUserDefaults().synchronize()
            print(pokemonArray)
            
        }
        
    }
    
    internal class Alert: NSObject {
        
        class func Warning(delegate: UIViewController, message: String) {
            let alert = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            delegate.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, error: String){
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.navigationController?.popToRootViewControllerAnimated(true)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}