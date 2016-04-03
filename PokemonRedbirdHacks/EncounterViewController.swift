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
            break;
            
        default:
            break;
        }
        
        
        
        
        
        
        
        if(caught){

            
//            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            [defaults setInteger:9001 forKey:@"HighScore"];
//            [defaults synchronize];
            
            
            
            
        }
        
        
        
        
    }
    

}