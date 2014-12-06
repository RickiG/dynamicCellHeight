//
//  ImageCell.swift
//  AutolayoutCellPoC
//
//  Created by Ricki Gregersen on 06/12/14.
//  Copyright (c) 2014 youandthegang.com. All rights reserved.
//

import UIKit

class ImageCell: SizeableTableViewCell, SizeableCell, UpdateableCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        updatePreferredLayoutSizes()
    }
    
    /*
    Method : updatePreferredLayoutSizes()
    The preferredMaxLayoutWidth must be reset
    on each layout for the dynamic sizing to work
    */
    func updatePreferredLayoutSizes() {
        titleLabel.preferredMaxLayoutWidth = CGRectGetWidth(titleLabel.frame)
        subTitleLabel.preferredMaxLayoutWidth = CGRectGetWidth(subTitleLabel.frame)
    }
    
    func update(data: AnyObject) {
        if let d = data as? CellImageData {
            titleLabel.text = d.title
            subTitleLabel.text = d.subTitle
            imgView.image = UIImage(named: d.imagePath)
        }
    }
}
