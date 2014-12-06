//
//  TableViewDelegate.swift
//  AutolayoutCellPoC
//
//  Created by Ricki Gregersen on 06/12/14.
//  Copyright (c) 2014 youandthegang.com. All rights reserved.
//

import UIKit

@objc protocol UpdateableCell {
    func update(data: AnyObject)
}

@objc protocol SizeableCell {
    func updatePreferredLayoutSizes()
}

class DynamicCellSizer {
    
    var tableView: UITableView
    var sizingCells: [String : UITableViewCell] = [ : ]
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func addSizingCellIdentifier(identifier: String) {
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell {
            sizingCells[identifier] = cell
        }
    }
    
    func cellForIdentifier(identifier: String, indexPath: NSIndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
    func heightForCellWithIdentifier(identifier: String, data: AnyObject) ->CGFloat {
        if let sizingCell = sizingCells[identifier] {
            if let updatableCell = sizingCell as? UpdateableCell {
                updatableCell.update(data)
            }
            sizingCell.bounds = CGRectMake(0, 0, CGRectGetWidth(tableView.frame), CGRectGetHeight(sizingCell.bounds))
            sizingCell.setNeedsLayout()
            sizingCell.layoutIfNeeded()
            let size = sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
            return size.height + 1
        }
        return 0
    }
}