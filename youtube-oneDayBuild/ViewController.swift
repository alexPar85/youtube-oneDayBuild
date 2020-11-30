//
//  ViewController.swift
//  youtube-oneDayBuild
//
//  Created by mac on 30/11/20.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

