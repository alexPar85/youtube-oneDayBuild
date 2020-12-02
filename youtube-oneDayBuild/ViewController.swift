//
//  ViewController.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {

    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the dataSource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set itself as the delegate of the model
        
        model.delegate = self
        model.getVideos()
    }
    // MARK: - Model Delegate Methods
    func videosFetched(_ videos: [Video]) {
        
        // Set the returned videos to my video property
        self.videos = videos
        
        // Refresh the tableView
        tableView.reloadData()
    }

    // MARK: - TaleView MEthods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // Configure the cell with the data
        
        // Get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

