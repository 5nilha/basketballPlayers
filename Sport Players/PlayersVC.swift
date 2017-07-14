//
//  PlayersVCTableViewController.swift
//  Sport Players
//
//  Created by Fabio Quintanilha on 7/12/17.
//  Copyright © 2017 Studio. All rights reserved.
//

import UIKit
import os.log


class PlayersVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // the line below call the players created onto the array to show in the TableView when the user navigates back from create or edit player
        NotificationCenter.default.addObserver(self, selector:#selector(PlayersVC.refreshTableView), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayersCell
        
        //TODO - NEED TO FIX
        if players.count == 0 {
            cell.playerName.text = "No Players Added"
            return cell
            
        }
        else {
            // PLAYERS INDEX =  (0: NAME), (1: AGE), (2: COUNTRY), (3: WEIGHT), (4: HEIGHT), (5: ID)
            let actualPlayer = players[indexPath.row]
            
            let name = actualPlayer[0]
            let age = actualPlayer[1]
            let country = actualPlayer[2]
            
            // Shows the name and age on the tableView
            cell.playerName.text = name
            cell.playerAge.text = age + " Years old"
            
            
            // Shows the flag image related to the coutry name selected
            switch country {
            case "France":
                cell.countryImage.image = UIImage(named: "France")
            case "Germany":
                cell.countryImage.image = UIImage(named: "Germany")
            case "USA":
                cell.countryImage.image = UIImage(named: "USA")
            case "Spain":
                cell.countryImage.image = UIImage(named: "Spain")
            case "Austria":
                cell.countryImage.image = UIImage(named: "Austria")
            default:
                cell.countryImage.image = UIImage(named: "Default")
            }
            
            /* call the function created on the class PlayersCell selected the player when we click the button to edit. It pass the actual player as an array with all player data as an argument. Through this function, we can access the actual player data on the "UpdatePlayerVC" file */
            cell.getPlayerToEdit(playerData: actualPlayer)
        }
       
        
        return cell
    }
    
    //To Delete the player
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        // this delete the player when the cell is swipped left
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            players.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    
    // here we prepare to send the player data to be available and shown on PlayerStatsVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
    
                if segue.identifier == "ShowDetail" {
                    
        
                    guard let selectedPlayerCell = sender as? PlayersCell else {
                        fatalError("Unexpected sender: \(sender)")
                    }
        
                    guard let indexPath = tableView.indexPath(for: selectedPlayerCell) else {
                        fatalError("The selected cell is not being displayed by the table")
                    }
                    
                    singlePlayer = players[indexPath.row]
                }
    }
    
    
    
    // The function below reload the data to appear in the actual View when the user navigates back form create player or edit
    func refreshTableView () {
        self.tableView.reloadData()
    }
    
    

}


// Here I created the PlayerCell Class.
class PlayersCell: UITableViewCell {
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerAge: UILabel!
   
   private var actualPlayerData:[String]!
    
    
    func getPlayerToEdit(playerData: [String]){
        actualPlayerData = playerData
    }

    
    @IBAction func editBtn(_ sender: Any) {
       
        //here I assign the actual player data array to the array singlePlayer. Doing it I can access the player on UpdatePlayerVC
        singlePlayer = actualPlayerData
        
        
    }
    
}
