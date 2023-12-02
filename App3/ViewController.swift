//
//  ViewController.swift
//  App3
//
//  Created by christopher conyersIV on 11/30/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, modelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // configure cell
        
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        // return cell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func videosFetched(_ videos: [Video]) {
        // set returned videos to videos properties
        self.videos = videos
        // refresh tableview
        
        tableView.reloadData()
        
    }
    


}

