//
//  PlayerNames.swift
//  IPL
//
//  Created by BridgeLabz on 23/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerNames: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    let players = Players()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reading the data from the json file
        players.readingJsondata()
        
        //Setting the background image
        let defaults = NSUserDefaults.standardUserDefaults()
        let temp = defaults.objectForKey("PlayerBackgroundImage") as! String
        self.tableView.backgroundView = UIImageView(image: UIImage(named:temp))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return players.numberOfPlayers()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("playercell", forIndexPath: indexPath)
        
        //Assigning the text and image to the table view cell
        cell.textLabel?.text = players.playerName(indexPath.row)
        cell.imageView!.image = UIImage(named: players.playerImage(indexPath.row))
        cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
        return cell
    }

    @objc func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //Tells which row is selected
        players.gettingPlayerDetails(indexPath.row)
    }
}
