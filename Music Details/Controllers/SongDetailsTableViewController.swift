//
//  SongDetailsTableViewController.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//
import UIKit

class SongDetailsTableViewController: UITableViewController {

    var theSongItem: SongItem?
    
    private var songDetailsTableDataSource = SongDetailsTableDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .systemGroupedBackground
        
        songDetailsTableDataSource = SongDetailsTableDataSource(theSongItem: theSongItem!)
        tableView.dataSource = songDetailsTableDataSource
        
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
}
