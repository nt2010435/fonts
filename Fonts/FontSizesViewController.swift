//
//  FontSizesViewController.swift
//  Fonts
//
//  Created by Kim Topley on 9/14/15.
//  Copyright © 2015 Apress Inc. All rights reserved.
//

import UIKit

class FontSizesViewController: UITableViewController {
    var font: UIFont!
    fileprivate static let pointSizes: [CGFloat] = [
        9, 10, 11, 12, 13, 14, 18, 24, 36, 48, 64, 72, 96, 144
    ]
    fileprivate static let cellIdentifier = "FontNameAndSize"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = FontSizesViewController.pointSizes[0]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func fontForDisplay(atIndexPath indexPath: IndexPath) -> UIFont {
        let pointSize = FontSizesViewController.pointSizes[indexPath.row]
        return font.withSize(pointSize)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return FontSizesViewController.pointSizes.count
    }
    
    override func tableView(_ tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                                withIdentifier: FontSizesViewController.cellIdentifier,
                                for: indexPath)
        
        cell.textLabel?.font = fontForDisplay(atIndexPath: indexPath)
        cell.textLabel?.text = font.fontName
        cell.detailTextLabel?.text = "\(FontSizesViewController.pointSizes[indexPath.row]) point"
        
        return cell
    }
}
