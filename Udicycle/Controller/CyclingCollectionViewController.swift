//
//  CyclingCollectionViewController.swift
//  Udicycle
//
//  Created by Elifazio Bernardes da Silva on 01/12/2017.
//  Copyright © 2017 Elifazio Bernardes da Silva. All rights reserved.
//

import UIKit

class CyclingCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    lazy var cyclingList: [CyclingActivity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //self.collectionView!.register(CyclingFavoriteCollectionViewCell.self, forCellWithReuseIdentifier: CyclingFavoriteCollectionViewCell.identifier)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.cyclingList = UdicycleModel().generateCycling(UdicycleModel.MAX_ROWS).sorted(by: { $0.distance > $1.distance })
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.cyclingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CyclingFavoriteCollectionViewCell.identifier, for: indexPath) as! CyclingFavoriteCollectionViewCell
        
        let cyclingItem = self.cyclingList[indexPath.row]
        
        cell.cyclingTitle.text = cyclingItem.title
        cell.cyclingDistance.text = cyclingItem.distanceFormatted
        cell.cyclingImage.downloadImageAsync(url: URL(string: cyclingItem.photoUrl)!)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateStyle = .long
        dateFormatterPrint.locale = Locale(identifier: "pt_BR")
        cell.cyclingDate.text = dateFormatterPrint.string(from: cyclingItem.date)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.backgroundImage.image = (cell as! CyclingFavoriteCollectionViewCell).cyclingImage.image
    }
    
    
}
