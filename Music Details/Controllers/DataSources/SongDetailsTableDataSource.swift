//
//  SongDetailsTableDataSource.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import Foundation
import UIKit

class SongDetailsTableDataSource: NSObject, UITableViewDataSource {
    
    private var theSongItem: SongItem?
    
    override init() {
        super.init()
    }
        
    init(theSongItem: SongItem) {
        self.theSongItem = theSongItem
        super.init()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
        if section == 0 {
            return "Song Details"
        }
            
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "songDetailsCell", for: indexPath) as? SongDetailsTableViewCell else {
            fatalError("Unable to dequeue songDetailCell")
        }
        
        if indexPath.row == 0 {
            cell.songDetailsLabel.text = "Track Name"
            cell.songDetailsLabelVal.text = theSongItem?.trackName ?? "(No track name)"
        }
        else if indexPath.row == 1 {
            cell.songDetailsLabel.text = "Artist Name"
            cell.songDetailsLabelVal.text = theSongItem?.artistName ?? "(No artist name)"
        }
        else if indexPath.row == 2 {
            cell.songDetailsLabel.text = "Release Date"
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd,yyyy"

            let songItemDate = theSongItem?.releaseDate ?? "(No release date)"
            
            if songItemDate != "(No release date)" {
                let date: Date? = dateFormatterGet.date(from: songItemDate)
                cell.songDetailsLabelVal.text = dateFormatterPrint.string(from: date!)
            } else {
                cell.songDetailsLabelVal.text = songItemDate
            }

        }
        else if indexPath.row == 3 {
            cell.songDetailsLabel.text = "Collection Name"
            cell.songDetailsLabelVal.text = theSongItem?.collectionName ?? "(No collection name)"
        }
        else if indexPath.row == 4 {
            cell.songDetailsLabel.text = "Collection Explicitness"
            cell.songDetailsLabelVal.text = theSongItem?.collectionExplicitness ?? "(No collection explicitness)"
        }
        else if indexPath.row == 5 {
            cell.songDetailsLabel.text = "Collection Price"
            cell.songDetailsLabelVal.text = String(format: "%f", theSongItem?.collectionPrice ?? 0.00)
        }
        else if indexPath.row == 6 {
            cell.songDetailsLabel.text = "Track Number"
            cell.songDetailsLabelVal.text = String(format: "%i", theSongItem?.trackNumber ?? 0)
        }
        else if indexPath.row == 7 {
            cell.songDetailsLabel.text = "Track Price"
            cell.songDetailsLabelVal.text = String(format: "%f", theSongItem?.trackPrice ?? 0.00)
        }
        else if indexPath.row == 8 {
            cell.songDetailsLabel.text = "Currency"
            cell.songDetailsLabelVal.text = theSongItem?.currency ?? "(No currency)"
        }
        else if indexPath.row == 9 {
            cell.songDetailsLabel.text = "Streamable"
            cell.songDetailsLabelVal.text = theSongItem?.isStreamable == true ? "Yes" : "No"
        }
        else if indexPath.row == 10 {
            cell.songDetailsLabel.text = "Country"
            cell.songDetailsLabelVal.text = theSongItem?.country ?? "(No country)"
        }

        
        return cell
    }
    
}
