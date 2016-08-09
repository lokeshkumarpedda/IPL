//
//  PlayerInformation.swift
//  IPL
//
//  Created by BridgeLabz on 25/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class PlayerInformation: UIViewController {
    
    //Outlets
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var viewOnScroll: UIView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerRole: UILabel!
    @IBOutlet weak var playerBattingStyle: UILabel!
    @IBOutlet weak var playerBowlingStyle: UILabel!
    @IBOutlet weak var playerDateOfBirth: UILabel!
    @IBOutlet weak var playerNationality: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerInfo()
        
        //Setting background
        let defaults = NSUserDefaults.standardUserDefaults()
        let temp = defaults.objectForKey("PlayerBackgroundImage") as! String
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: temp)!)
        viewOnScroll.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Assigning values to the elements in the view
    func playerInfo() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let temp = defaults.objectForKey("PlayerInformationToDisplay") as! NSDictionary
        playerImageView.image = UIImage(named: temp["player_img_url"] as! String)
        playerName.text = temp["player_name"] as? String
        playerRole.text = temp["player_role"] as? String
        playerBattingStyle.text = temp["player_batting_style"] as? String
        playerBowlingStyle.text = temp["player_bowling_style"] as? String
        playerDateOfBirth.text = temp["player_dob"] as? String
        playerNationality.text = temp["player_nationality"] as? String
    }
}
