//
//  UpdatePlayerVC.swift
//  Sport Players
//
//  Created by Fabio Quintanilha on 7/13/17.
//  Copyright © 2017 Studio. All rights reserved.
//

import UIKit

class UpdatePlayerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var playerAge: UITextField!
    @IBOutlet weak var playerHeight: UITextField!
    @IBOutlet weak var playerWeight: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var selectedCountry: UITextField!
    @IBOutlet weak var playerCountry: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryPicker.dataSource = self
        self.countryPicker.delegate = self
        
        // indexes =  0: name, 1: age, 2: country, 3: weight, 4: height, 5: ID
        if players.count > 0 {
            playerName.text = singlePlayer[0]
            playerAge.text = singlePlayer[1]
            selectedCountry.text = singlePlayer[2]
            playerHeight.text = singlePlayer[3]
            playerWeight.text = singlePlayer[4]
            
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return COUNTRIES.count
    }
    
    
    // MARK: Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return COUNTRIES[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = COUNTRIES[row]
        selectedCountry.text = selected
        
        switch selected {
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
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = COUNTRIES[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Avenir Book", size: 19.0)!, NSForegroundColorAttributeName: UIColor.white])
        return myTitle
    }

    
    @IBAction func updateBtn(_ sender: Any) {
        
        let row = countryPicker.selectedRow(inComponent: 0)
        
        let country = COUNTRIES[row]
        let name = playerName.text!
        let age = playerAge.text!
        let height = playerHeight.text!
        let weight = playerWeight.text!

        
        // PLAYERS INDEX =  (0: NAME), (1: AGE), (2: COUNTRY), (3: WEIGHT), (4: HEIGHT), (5: ID)
        var i = 0
        while i < players.count {
            var j = 0
            while j < players[i].count {
                
                if players[i][5] == singlePlayer[5] { // here we evaluate using the player Id if the player found is the same we're looking to update
                    
                    switch j {
                    case 0:
                        players[i][j] = name
                    case 1:
                        players[i][j] = age
                    case 2:
                        players[i][j] = country
                    case 3:
                        players[i][j] = weight
                    case 4:
                        players[i][j] = height
                    default:
                        print ("error: index out of range")
                    }
                }
                j += 1
            }
            i += 1
        }

         // the line below call the players created onto the array to show in the TableView when the user navigates back from create or edit player
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        _ = self.navigationController?.popViewController(animated: true)
    }
}
