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
            savePokemon("quad", caught: true)
            break;
            
        default:
            break;
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
        
        
        
        
        
//        let newPoke = pokemon(name: name,caught: caught)
//        var pokemonArray = NSUserDefaults.standardUserDefaults().objectForKey("pokemon") as? [pokemon]
////        if let pokemonData = NSUserDefaults.standardUserDefaults().objectForKey("pokemon") as? NSData{
////            
////            if var pokemonArray = NSKeyedUnarchiver.unarchiveObjectWithData(pokemonData) as? [pokemon] {
////                
//        
//        pokemonArray?.append(newPoke)
//                NSUserDefaults.standardUserDefaults().setObject(pokemonArray, forKey: "pokemon")
//                NSUserDefaults.standardUserDefaults().synchronize()
////            }
////            
//        }
    }
    
//        var pokemonArray  = [pokemon]()
//        pokemonArray.append(newPoke)
//        
//        //error here
//        //let pokemonData = NSKeyedArchiver.archivedDataWithRootObject(pokemonArray)
//        let myData = NSKeyedArchiver.archivedDataWithRootObject(newPoke)
//        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "pokemon")

        
        //print("here -------------")
        //NSUserDefaults.standardUserDefaults().setObject(pokemonData, forKey: "pokemon")
    
    

}