//
//  VideoViewController.swift
//  MealMe
//
//  Created by Ahmed ibrahim on 5/21/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class VideoViewController: UIViewController {
    
    @IBOutlet weak var playerView: WKYTPlayerView!
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardViewStyle()
        displayTheVideo()

    }
    
    func displayTheVideo(){
        let ID = url.components(separatedBy: "v=")[1]
        playerView.load(withVideoId: ID)
    }

    func cardViewStyle(){
        playerView.layer.cornerRadius = 20
        playerView.layer.shadowColor = UIColor.black.cgColor
        playerView.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)  //Here you control x and y
        playerView.layer.shadowOpacity = 0.7
        playerView.layer.shadowRadius = 5.0 //Here your control your blur
        playerView.layer.masksToBounds =  false
    }
}
