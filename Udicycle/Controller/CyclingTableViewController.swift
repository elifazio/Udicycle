//
//  CyclingTableViewController.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import UIKit

class CyclingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var cyclingList: [CyclingActivity] = []
    lazy var originalCyclingList: [CyclingActivity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //self.cyclingList = UdicycleModel().generateCycling(UdicycleModel.MAX_ROWS)
        //self.originalCyclingList = self.cyclingList
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.cyclingList = UdicycleModel().generateCycling(UdicycleModel.MAX_ROWS)
        self.originalCyclingList = self.cyclingList
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cyclingList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CyclingTableViewCell.identifier, for: indexPath) as! CyclingTableViewCell
        
        let cyclingItem = self.cyclingList[indexPath.row]
        
        cell.cyclingTitle.text = cyclingItem.title
        cell.cyclingDistance.text = cyclingItem.distanceFormatted
        cell.cyclingImage.downloadImageAsync(url: URL(string: cyclingItem.photoUrl)!, anotherImageView: cell.backgoundImage)
        //cell.backgoundImage.downloadImageAsync(url: URL(string: cyclingItem.photoUrl)!)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateStyle = .long
        dateFormatterPrint.locale = Locale(identifier: "pt_BR")
        cell.cyclingDate.text = dateFormatterPrint.string(from: cyclingItem.date)
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableView.beginUpdates()
            self.cyclingList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveItem = self.cyclingList[sourceIndexPath.row]
        self.cyclingList.remove(at: sourceIndexPath.row)
        self.cyclingList.insert(moveItem, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return tableView.isEditing ? .none : .delete
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.cyclingList = self.originalCyclingList
            self.tableView.reloadData()
            return
        }
        
        let filtered = self.originalCyclingList.filter({
            let textToSearch = "\($0.title) \($0.distance)"
            return textToSearch.range(of: searchText) != nil
        })
        self.cyclingList = filtered
        
        self.tableView.reloadData()
    }
    
}
