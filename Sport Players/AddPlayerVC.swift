//
//  AddPlayerVC.swift
//  Sport Players
//
//  Created by Fabio Quintanilha on 7/12/17.
//  Copyright © 2017 Studio. All rights reserved.
//

import UIKit



class AddPlayerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var ageTxtField: UITextField!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!

    @IBOutlet weak var playerCountry: UIImageView!
    @IBOutlet weak var countrySelected: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryPicker.dataSource = self
        self.countryPicker.delegate = self
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
        
        // Add to the player the flag image related to the coutry name selected
        countrySelected.text = selected
        
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
        //Change the Picker View Text Color
        let titleData = COUNTRIES[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Avenir Book", size: 19.0)!, NSForegroundColorAttributeName: UIColor.white])
        return myTitle
    }

    

    @IBAction func btnPressed(_ sender: Any) {
        // Get the index of the selected country on Picker View
        let row = countryPicker.selectedRow(inComponent: 0)
       
        let country = COUNTRIES[row]
        let name = nameTxtField.text!
        let age = ageTxtField.text!
        let height = heightTxtField.text!
        let weight = weightTxtField.text!
        
        
        // ------ HERE THE PLAYER IS CREATED AS OBJECT AND STORED IN AN ARRAY --------
//        The player is created here as an Object and appended to an array. The object file can be found on the file players.swift
        let player = Player(name: name, age: age, country: country, weight: weight, height: height)
        players.append([player.getName(), player.getAge(), player.getCountry(), player.getWeight(), player.getHeight(), player.getID()])
        // PLAYERS INDEX =  (0: NAME), (1: AGE), (2: COUNTRY), (3: WEIGHT), (4: HEIGHT), (5: ID)
        
        
         // the line below call the players created onto the array to show in the TableView when the user navigates back from create or edit player
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        
        
         // back to the previous VC
        _ = self.navigationController?.popViewController(animated: true)
  
    }

}
