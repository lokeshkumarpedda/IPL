//
//  TeamInformation.swift
//  IPL
//
//  Created by BridgeLabz on 22/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class TeamInformation: UIViewController ,UIScrollViewDelegate{
    //outlets
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var groundImgView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewOnScroll: UIView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var captain: UILabel!
    @IBOutlet weak var ground: UILabel!
    @IBOutlet weak var owner: UILabel!
    @IBOutlet weak var coach: UILabel!
    
    let info = TeamNames()
    var temp : NSDictionary!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reading data from json file
        
        info.readingJsondata()
        temp = info.gettingTeamInfo()
        
        //Adding background image to the view
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:  temp["team_background"] as! String)!)
        //viewOnScroll.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
        
        
        
        //Storing the image url in NSUserDefaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(temp["team_background"], forKey: "PlayerBackgroundImage")
        
        //Setting team information
        self.teamInformation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Setting values to the elements in the view
    func teamInformation(){
        groundImgView.image = UIImage(named: temp["team_ground"] as! String)
        logoImgView.image = UIImage(named: temp["team_img_url"] as! String)
        teamName.text = temp["team_name"] as? String
        captain.text = temp["team_captain"] as? String
        coach.text = temp["team_coach"] as? String
        ground.text = temp["team_home_venue"] as? String
        owner.text = temp["team_owner"] as? String
    }
}
