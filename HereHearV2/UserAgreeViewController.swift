//
//  UserAgreeViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/14.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class UserAgreeViewController: BaseViewController {
    
    @IBOutlet weak var labTitle:UILabel!
    @IBOutlet weak var txtView:UITextView!
    @IBOutlet weak var btn:UIButton!
    @IBOutlet weak var check:UIButton!
    @IBOutlet weak var lab:UILabel!
    var flag = true

    override func viewDidLoad() {
        super.viewDidLoad()
        if !Constants.getFirstVideoPlayStatus() {
            self.playVideo()
        }
        else{
            self.setUserInterface()
        }
    }
    
    func setUserInterface() {
        self.labTitle.text = NSLocalizedString("userAgree", comment: "")
        self.txtView.text = NSLocalizedString("userAgreeContent", comment: "")
        self.btn.setTitle(NSLocalizedString("confirm", comment: ""), for: .normal)
        self.lab.text = NSLocalizedString("understand", comment: "")
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "LaunchVideo", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        playerController.player = player
        playerController.showsPlaybackControls = false
        NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        self.present(playerController, animated: false) {
            player.play()
        }
    }
    
    @objc func playerDidFinishPlaying(sender: Notification) {
        self.dismiss(animated: false, completion: nil)
        Constants.setFirstVideoPlayStatus()
        self.setUserInterface()
    }
    
    @IBAction func doAgree() {
        if flag {
            self.check.setBackgroundImage(UIImage(named: "check_empty"), for: .normal)
            self.btn.setBackgroundImage(UIImage(named: "btnW"), for: .normal)
            self.btn.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
            self.btn.isEnabled = false
        }
        else{
            self.check.setBackgroundImage(UIImage(named: "checked"), for: .normal)
            self.btn.setBackgroundImage(UIImage(named: "btnP"), for: .normal)
            self.btn.setTitleColor(UIColor.white, for: .normal)
            self.btn.isEnabled = true
        }
        flag = !flag
    }
}
