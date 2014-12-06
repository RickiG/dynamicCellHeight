dynamicCellHeight
=================

Example of dynamic sizing of tableView cells with autolayout

### Usage:

Make sure the cell classes you want to size dynamically conforms to the SizeableCell and UpdateableCell protocols.

        dynamicCellSizer = DynamicCellSizer(tableView: tableView)
        dynamicCellSizer?.addSizingCellIdentifier("TextCellIdentifier")
        dynamicCellSizer?.addSizingCellIdentifier("ImageCellIdentifier")
        
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
