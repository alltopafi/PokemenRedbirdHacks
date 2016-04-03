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
    
    var dataPassed:String!
    var locationString:String = ""
    var caught:Bool = false

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func pokeball(sender: AnyObject) {
        caught = true
        switch(locationString){
        case "everest":
            savePokemon("Articuno", caught: true)
            displayAlert("Catch 'em All", error: "Articuno was caught!")
            break;
        case "pompeii":
            savePokemon("Moltres", caught: true)
            displayAlert("Catch 'em All", error: "Moltres was caught!")
            break;
        case "japan":
            savePokemon("GoldenDragonPirate", caught: true)
            displayAlert("Catch 'em All", error: "GoldenDragonPirate was caught!")
            break;
        case "quad":
            savePokemon("Snorlax", caught: true)
            displayAlert("Catch 'em All", error: "Snorlax was caught!")
            break;
            
        default:
            break;
        }
        
        //transition back to map
        

        
        
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
            break;
        case "pompeii":
            imageView.image=UIImage(named: "pompeii")
            break;
        case "japan":
            imageView.image=UIImage(named: "japan")
            break;
        case "quad":
            imageView.image=UIImage(named: "quad")
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
    
//    internal class Alert: NSObject {
//        
//        class func Warning(delegate: UIViewController, message: String) {
//            let alert = UIAlertController(title: "Warning", message: message, preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            delegate.presentViewController(alert, animated: true, completion: nil)
//        }
//        
//    }
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func displayAlert(title:String, error: String){
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            self.navigationController?.popToRootViewControllerAnimated(true)
//(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
}