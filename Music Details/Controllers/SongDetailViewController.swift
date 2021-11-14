//
//  DetailViewController.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import UIKit

class SongDetailViewController: UIViewController {

    var theSongItem: SongItem?
    
    private var subSongDetailVC: SubSongDetailViewController?
    private var songDetailsTableVC: SongDetailsTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSubSongDetailVC" {
            subSongDetailVC = segue.destination as? SubSongDetailViewController
            subSongDetailVC?.theSongItem = theSongItem
        }

        if segue.identifier == "ToSongDetailsTableVC" {
            songDetailsTableVC = segue.destination as? SongDetailsTableViewController
            songDetailsTableVC?.theSongItem = theSongItem
        }
    }
    
}
