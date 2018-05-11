//
//  MovingTableViewController.swift
//  MandoBootcamp
//
//  Created by user on 10/5/18.
//  Copyright © 2018 Mar Balibrea Rull. All rights reserved.
//

import UIKit

class MovingTableViewController: UITableViewController {
    
    @IBOutlet var anglesTableView: UITableView!
    
    var angles:[String] = ["5 º","10 º","15 º","20 º","25 º","30 º","35 º","40 º","45 º","50 º","55 º","60 º","65 º","70 º","75 º","80 º","85 º"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.angles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.anglesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = self.angles[indexPath.row]
        
        return cell
    }
    
    //comes back to the main view when a cell is clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil) //para volver
    }
    
}
