//
//  CompleteUploadViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/16.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit
import Lottie

class CompleteUploadViewController: BaseViewController {

    @IBOutlet weak var animView:UIView!
    @IBOutlet weak var btnOK:UIButton!
    @IBOutlet weak var uploadComp:UILabel!
    @IBOutlet weak var lab1:UILabel!
    @IBOutlet weak var lab2:UILabel!
    @IBOutlet weak var desc:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnOK.setTitle(NSLocalizedString("confirm", comment: ""), for: .normal)
        self.uploadComp.text = NSLocalizedString("upload_complete", comment: "")
        self.lab1.text = String(format: "%@:  %@", NSLocalizedString("story_num", comment: ""), "1A3D9V")
        self.lab2.text = String(format: "%@:          %@", NSLocalizedString("password", comment: ""), "1A2365B2d4Z38")
        self.desc.text = NSLocalizedString("comp_desc", comment: "")

        self.playCompleteVideo()
    }
    
    func playCompleteVideo() {
        let animationView = AnimationView(name: "Complete")
        animationView.frame = CGRect(x: 0, y: 0, width: self.animView.frame.size.width, height: self.animView.frame.size.height)
        animationView.center = self.animView.center
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        self.animView.addSubview(animationView)
        animationView.play()
    }

}
