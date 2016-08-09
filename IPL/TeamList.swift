//
//  TeamList.swift
//  IPL
//
//  Created by BridgeLabz on 21/07/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
var globalnumber : Int!     //Taking a global value
class TeamList: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    let teamname = TeamNames()
    override func viewDidLoad() {
        super.viewDidLoad()
        //reading the json file when the view is loaded
        
  
        teamname.readingJsondata()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
       
        //Getting team name and info
        let temp = teamname.gettingTeamName(indexPath.row)
        
        //Setting logo image
        cell.imageView!.image = UIImage(named: temp.1)
        
        //Adding background image
        let imageView = UIImageView(frame: CGRectMake(0, 0, cell.frame.width , cell.frame.height))
        let image = UIImage(named: temp.2)
        imageView.image = image
        cell.backgroundView = UIView()
        cell.backgroundView?.addSubview(imageView)
        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        //Assigning cell text
        cell.textLabel?.text = temp.0
        cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0)
        return cell
    }
    
    
    @objc func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //Assigning selected row number to the 
        globalnumber = indexPath.row
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        tableView.reloadData()
    }

}