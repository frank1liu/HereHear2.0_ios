//
//  SayStoryViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/13.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class SayStoryViewController: BaseViewController {

    @IBOutlet weak var cancel: UILabel!
    @IBOutlet weak var string: UILabel!
    @IBOutlet weak var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.playAudioFile(filename: "SayStory1", type: "wav")
        self.cancel.text = NSLocalizedString("cancel", comment: "")
        let attributedString = NSMutableAttributedString(string: NSLocalizedString("motionstring", comment: ""))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        string.attributedText = attributedString
        
        self.btn.setTitle(NSLocalizedString("confirm", comment: ""), for: .normal)
        self.btn.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        super.stopAudioFile()
    }
    
    @IBAction func selectFace(_ sender: UIButton){
        for i in 101...105 {
            let b:UIButton = self.view.viewWithTag(i) as! UIButton
            b.setBackgroundImage(UIImage(named: String(format: "face%d", i-100)), for: .normal)
        }
        let tag:Int = sender.tag
        sender.setBackgroundImage(UIImage(named: String(format: "face%d", tag+5-100)), for: .normal)
        self.btn.setBackgroundImage(UIImage(named: "btnP"), for: .normal)
        self.btn.setTitleColor(UIColor.white, for: .normal)
        self.btn.isEnabled = true
    }

    @IBAction func next() {
        super.stopAudioFile()
        let vc = PrepareRecordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
