dynamicCellHeight
=================

Example of dynamic sizing of tableView cells with autolayout
[It's Herbert!](screen-shot.png)


### Usage:

Make sure the cell classes you want to size dynamically conforms to the SizeableCell and UpdateableCell protocols.

        dynamicCellSizer = DynamicCellSizer(tableView: tableView)
        dynamicCellSizer?.addSizingCellIdentifier("TextCellIdentifier")
        dynamicCellSizer?.addSizingCellIdentifier("ImageCellIdentifier")

The dynamicCellSizer keeps a reference to each of the type of cells added, these are never displayed
in the tableView. Instead the cell is configured with data for the corrosponding indexPath, forced to layout with 
sizingCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
the height is then retured for the actual cell in the tableView

  Use the dynamicCellSizer as such:
  
      func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let data: AnyObject = dataSource.dataForIndexPath(indexPath)
        if let identifier = cellIdentifierForData(data) {
            if let d = dynamicCellSizer {
                return d.heightForCellWithIdentifier(identifier, data: data)
            }
        }
        return 0
    }
