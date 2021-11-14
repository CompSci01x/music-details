//
//  MainTableDataSource.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import Foundation
import UIKit

class MainTableDataSource: NSObject, UITableViewDataSource {
    
    private var apiResponse: iTunesSearchResponse?
    
    override init() {
        super.init()
    }
    
    init(apiResponse: iTunesSearchResponse) {
        self.apiResponse = apiResponse
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResponse!.numOfSongs
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "theSongCell", for: indexPath) as? SongTableViewCell else {
            fatalError("Unable to dequeue theSongCell")
        }
        
        let trackNameStr = apiResponse!.songItems[indexPath.row].trackName
        cell.theSongLabel.text = trackNameStr ?? "(No track name)"
        
        
        return cell
    }
    
}
