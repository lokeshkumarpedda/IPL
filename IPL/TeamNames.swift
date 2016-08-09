//
//  TeamNames.swift
//  IPL
//
//  Created by BridgeLabz on 22/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//
import Foundation


//This class will deals with team information
class TeamNames: NSObject {
    
    var jsonDict = [NSDictionary]()
    //Read the data and store it in the jsonDict array of dictionaries
    func readingJsondata(){
        if let path = NSBundle.mainBundle().URLForResource("document", withExtension: "json", subdirectory: "TeamInfo") {
            let data :NSData! =  NSData(contentsOfURL: path)
            do{
                jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary]
            }
            catch{
                print("Error")
            }
            
        }
    }
    
    
    //Take row number and gives details of the particular team
    func gettingTeamName(number : Int) -> (String,String,String) {
        let temp = jsonDict[number]
        let name = temp.valueForKey("team_name") as! String
        let logo = temp.valueForKey("team_img_url") as! String
        let background = temp.valueForKey("team_background") as! String
        return (name,logo,background)
    }

    
    //Take the row number and returns team information
    func gettingTeamInfo() -> NSDictionary  {
        return jsonDict[globalnumber]
    }
    
}