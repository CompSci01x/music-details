//
//  MainTableViewController.swift
//  Music Details
//
//  Created by Spruce Tree on 11/14/21.
//

import UIKit

class MainTableViewController: UITableViewController {

    private var mainTableDataSource = MainTableDataSource()
    private var apiResponse: iTunesSearchResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Songs List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.backgroundColor = .systemGroupedBackground
        
        // URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift") else {
            fatalError("Error creating url obj");
        }
        
        // this api call section should probably belong in a seperate class and also be asynchronous
        let sem = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in

            defer { sem.signal() }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                fatalError("error with httpResponse")
            }
            
//            print("JSON string: \(String(data: data!, encoding: .utf8) ?? "" )")

            let decoder = JSONDecoder()
            let theData = data
            self.apiResponse = try! decoder.decode(iTunesSearchResponse.self, from: theData!)
        })
        task.resume()
        sem.wait()
        
        mainTableDataSource = MainTableDataSource(apiResponse: self.apiResponse!)
        self.tableView.dataSource = mainTableDataSource
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSongDetailVC" {
            let destVC = segue.destination as! SongDetailViewController
            let cell = sender as! UITableViewCell
            destVC.theSongItem = apiResponse?.songItems[tableView.indexPath(for: cell)!.row]
        }
    }

}
