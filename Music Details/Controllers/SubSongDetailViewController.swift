//
//  SubSongDetailViewController.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import UIKit

class SubSongDetailViewController: UIViewController {

    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var artistNameLabel: UILabel!
    @IBOutlet var artWorkImg: UIImageView!
    
    var theSongItem: SongItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songTitleLabel.text = theSongItem?.trackName ?? "(No song name)"
        artistNameLabel.text = theSongItem?.artistName ?? "(No artist name)"
        
        var theImgData = Data()

        // URL
        guard let url = URL(string: theSongItem?.artworkUrl100 ?? "") else {
            fatalError("Error creating url obj");
        }
        
        // again this api call section should probably belong in a seperate class and also be asynchronous
        let sem = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in

            defer { sem.signal() }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                fatalError("error with httpResponse")
            }
            
            theImgData = data!
        })
        task.resume()
        sem.wait()
        
        artWorkImg.image = UIImage(data: theImgData)
        artWorkImg.layer.cornerRadius = 10
        self.view.layer.cornerRadius = 10
        
    }

}
