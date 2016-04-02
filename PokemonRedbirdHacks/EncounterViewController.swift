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


    override func viewDidLoad() {
        super.viewDidLoad()
    
       // locationString=dataPassed
        //print(dataPassed)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print(locationString)
    }
    
//    convenience init(locationString: String )
//    {
//        self.init()
//        self.locationString = locationString
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    init(){
////        super.init()
//        super.init(nibName: nil, bundle: nil)
//
//    }
}