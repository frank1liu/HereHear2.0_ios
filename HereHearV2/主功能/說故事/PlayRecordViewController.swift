//
//  PrepareRecordViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/15.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class PlayRecordViewController: BaseViewController {
   
    @IBOutlet weak var cancel: UILabel!
    @IBOutlet weak var titlStr: UILabel!
    @IBOutlet weak var tabBarView:UIView!
    @IBOutlet weak var bgImageView:UIImageView!
    @IBOutlet weak var btnRecString:UIButton!
    @IBOutlet weak var btnImgView:UIImageView!
    @IBOutlet weak var btnOrgVoice:UIButton!
    @IBOutlet weak var labChooseVoice:UILabel!

    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cancel.text = NSLocalizedString("cancel", comment: "")
        self.titlStr.text = NSLocalizedString("tab3Str", comment: "")
        self.btnRecString.setTitle(NSLocalizedString("try_listen", comment: ""), for: .normal)
        self.btnOrgVoice.setTitle(NSLocalizedString("org_voice", comment: ""), for: .normal)
        self.labChooseVoice.text = NSLocalizedString("voice_choice", comment: "")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let size:(CGFloat, CGFloat) = Constants.getScreenSize()
        self.tabBarView.frame = CGRect(x: 0, y: size.1 - 200.0, width: size.0, height: 200 )
        self.view.addSubview(tabBarView)
        self.view.bringSubviewToFront(tabBarView)
    }
    
    @IBAction func doPlayAndPause() {
        if isPlaying == false {
            self.btnImgView.image = UIImage(named: "pauseBtn")
            self.btnRecString.setTitle(NSLocalizedString("pause", comment: ""), for: .normal)
            isPlaying = true
        }
        else {
            self.btnImgView.image = UIImage(named: "playBtn")
            self.btnRecString.setTitle(NSLocalizedString("try_listen", comment: ""), for: .normal)
            isPlaying = false
        }
    }
    
    @IBAction func doSave() {
        let vc = StoryTagViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func doRerecord() {
        self.navigationController?.popToViewController(recordVC, animated: true)
    }
    
    @IBAction func changeVoice(_ sender:UIButton) {
        var array = [100,101,102,103,104]
        
        if sender.tag == 100 {
            setSelectOrgVoiceBtn(flag: true, sender: sender)
            if let index = array.firstIndex(of: 100) {
                array.remove(at: index)
                self.setOtherVocieBtnColor(tags: array)
            }
        }
        else {
            self.setSelectedOtherBtnColor(tag: sender.tag, sender: sender)
            if let index = array.firstIndex(of: sender.tag) {
                array.remove(at: index)
                if let index = array.firstIndex(of: 100) {
                    array.remove(at: index)
                }
                self.setSelectOrgVoiceBtn(flag: false, sender: self.view.viewWithTag(100) as! UIButton)
                self.setOtherVocieBtnColor(tags: array)
            }
        }
    }
    
    func setSelectOrgVoiceBtn(flag:Bool, sender:UIButton) {
        if flag {
            sender.setBackgroundImage(UIImage(named: "btnP1"), for: .normal)
            sender.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            sender.setBackgroundImage(UIImage(named: "btnW1"), for: .normal)
            sender.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
        }
    }
    
    func setSelectedOtherBtnColor(tag:Int, sender:UIButton) {
        sender.backgroundColor = Constants.getPurpleColor()
        sender.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setOtherVocieBtnColor(tags:[Int]) {
        for tag in tags {
            let btn:UIButton = self.view.viewWithTag(tag) as! UIButton
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
        }
    }
}
