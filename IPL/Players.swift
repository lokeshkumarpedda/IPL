//
//  Players.swift
//  IPL
//
//  Created by BridgeLabz on 23/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//This class will deals with player information
class Players: NSObject {
    var jsonDict = [NSDictionary]()
    let names = ["delhi_daredevils","gujrat_lions","kings_xi_punjab","kolkata_knight_riders","mumbai_indians","rising_pune_supergiants","royal_challengers_bangalore","sunrisers_hyderabad"]
    
    //Read the player details and store it in jsonDict
    func readingJsondata(){
        if let path = NSBundle.mainBundle().URLForResource(names[globalnumber], withExtension: "json", subdirectory: "PlayerInfo") {
            let data :NSData! =  NSData(contentsOfURL: path)
            do{
                jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary]
            }
            catch{
                print("Error")
            }
        }
    }

    //returns details of particular player details
    func playerName(index : Int) -> String {
        let temp = jsonDict[index].valueForKey("player_name") as! String
        return temp
    }
    
    //returns player image
    func playerImage(index : Int) -> String {
        return (jsonDict[index].valueForKey("player_img_url") as! String)
    }
    
    
    //returns total number of players
    func numberOfPlayers() -> Int {
    
        return jsonDict.count
    }
    
    //stores player information in NSUserDefaults
    func gettingPlayerDetails(index : Int) {
        let playerDetails = jsonDict[index]
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(playerDetails, forKey: "PlayerInformationToDisplay")
        
    }
}
