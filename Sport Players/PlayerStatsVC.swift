//
//  PlayerStatsVC.swift
//  Sport Players
//
//  Created by Fabio Quintanilha on 7/14/17.
//  Copyright © 2017 Studio. All rights reserved.
//

import UIKit

class PlayerStatsVC: UIViewController {

    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerAge: UILabel!
    @IBOutlet weak var playerCountry: UIImageView!
    @IBOutlet weak var playerHeight: UILabel!
    @IBOutlet weak var playerWeight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DEVELOPER: SELECTED \(singlePlayer)") // Just to debug
        
        // PLAYERS INDEX =  (0: NAME), (1: AGE), (2: COUNTRY), (3: WEIGHT), (4: HEIGHT), (5: ID)
        if players.count > 0 {
            playerName.text = singlePlayer[0]  // name
            playerAge.text = singlePlayer[1]  + " Years Old"  // Age
            playerWeight.text = singlePlayer[3] + " Lbs"  // weight
            playerHeight.text = singlePlayer[4] + "\"" // height

            switch singlePlayer[2] {
                case "France":
                    playerCountry.image = UIImage(named: "France")
                case "Germany":
                    playerCountry.image = UIImage(named: "Germany")
                case "USA":
                    playerCountry.image = UIImage(named: "USA")
                case "Spain":
                    playerCountry.image = UIImage(named: "Spain")
                case "Austria":
                    playerCountry.image = UIImage(named: "Austria")
                default:
                    playerCountry.image = UIImage(named: "Default")
                }
            
        }
    }
    

}
