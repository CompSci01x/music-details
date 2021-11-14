//
//  SongTableViewCell.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var theSongLabel: UILabel!
    @IBOutlet var artWorkImg: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        theSongLabel.numberOfLines = 2
    }

}
