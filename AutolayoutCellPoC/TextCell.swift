//
//  BasicCell.swift
//  AutolayoutCellPoC
//
//  Created by Ricki Gregersen on 05/12/14.
//  Copyright (c) 2014 youandthegang.com. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell, UpdateableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        updatePreferredLayoutSizes()
    }
    
    func updatePreferredLayoutSizes() {
        titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(titleLabel.frame)
        subTitleLabel.preferredMaxLayoutWidth = CGRectGetWidth(subTitleLabel.frame)
    }

    func update(data: AnyObject) {
        if let d = data as? CellTextData {
            titleLabel.text = d.title
            subTitleLabel.text = d.subTitle
        }
    }
}
