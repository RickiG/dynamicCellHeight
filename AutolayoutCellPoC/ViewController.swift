//
//  ViewController.swift
//  AutolayoutCellPoC
//
//  Created by Ricki Gregersen on 05/12/14.
//  Copyright (c) 2014 youandthegang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = TableViewData()
    let cellIdentifiers: (text: String, image: String) = (text : "TextCellIdentifier", image : "ImageCellIdentifier")
    var dynamicCellSizer: DynamicCellSizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicCellSizer = DynamicCellSizer(tableView: tableView)
        dynamicCellSizer?.addSizingCellIdentifier(cellIdentifiers.text)
        dynamicCellSizer?.addSizingCellIdentifier(cellIdentifiers.image)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        recycleData()
    }
    
    func recycleData() {
        dataSource.cycleData()
        tableView.reloadData()
    }
    
    @IBAction func recycleAction(sender: AnyObject) {
        recycleData()
    }
    //MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let data: AnyObject = dataSource.dataForIndexPath(indexPath)
        if let identifier = cellIdentifierForData(data) {
            let cell = dynamicCellSizer?.cellForIdentifier(identifier, indexPath: indexPath)
            if let updatableCell = cell as? UpdateableCell {
                updatableCell.update(data)
            }
            return cell!
        }
        return UITableViewCell()
    }
    
    //MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data: AnyObject = dataSource.dataForIndexPath(indexPath)
        if let identifier = cellIdentifierForData(data) {
            if let d = dynamicCellSizer {
                return d.heightForCellWithIdentifier(identifier, data: data)
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    /*
        This can be done with less code, but also less flexibility.
        Could keep a dictionary with keys of "class" mapping to "cellIdentifier".
        With this approach it is simple to map the same kind of object (maybe depending on the absence of 
        certain properties) to different cells - or in the case of "job" and "fresh job". Same object, different cell
    */
    
    func cellIdentifierForData(data: AnyObject) ->String? {
        if let obj = data as? CellTextData {
            return cellIdentifiers.text
        } else if let obj = data as? CellImageData {
            return cellIdentifiers.image
        }
        return nil;
    }
}

