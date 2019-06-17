//
//  PrepareRecordViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/15.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class StoryTagViewController : BaseViewController,UITextFieldDelegate {
   
    @IBOutlet weak var titlStr: UILabel!
    @IBOutlet weak var language: UILabel!
    @IBOutlet weak var storyType: UILabel!
    @IBOutlet weak var motionStatus: UILabel!
    @IBOutlet weak var storyMark: UILabel!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    var once = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.doUpload), name: Notification.Name("DoUpload"), object: nil)
        self.titlStr.text = NSLocalizedString("tab3Str", comment: "")
        self.language.text = NSLocalizedString("language", comment: "")
        self.storyType.text = NSLocalizedString("story_type", comment: "")
        self.motionStatus.text = NSLocalizedString("motion_status", comment: "")
        self.storyMark.text = NSLocalizedString("story_mark", comment: "")
        self.field.delegate = self
        self.field.placeholder = NSLocalizedString("story_mark_holder", comment: "")
    }
    
    @objc func doUpload() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let vc = UploadProcessViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if once <= 1 {
            self.scrollView.contentSize = CGSize(width: self.scrollView.contentSize.width, height: self.scrollView.contentSize.height + 84.0)
            once += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLanguageBtn()
        self.setLifeType()
        self.setMotionType()
        self.setSaveType()
    }
    
    func setLanguageBtn() {
        let btn1 = self.view.viewWithTag(100) as! UIButton
        let btn2 = self.view.viewWithTag(101) as! UIButton
        let btn3 = self.view.viewWithTag(102) as! UIButton
        btn1.setTitle(NSLocalizedString("lang_trad", comment: ""), for: .normal)
        btn2.setTitle(NSLocalizedString("lang_simp", comment: ""), for: .normal)
        btn3.setTitle(NSLocalizedString("lang_eng", comment: ""), for: .normal)
    }
    
    func setLifeType() {
        let btn1 = self.view.viewWithTag(200) as! UIButton
        let btn2 = self.view.viewWithTag(201) as! UIButton
        let btn3 = self.view.viewWithTag(202) as! UIButton
        let btn4 = self.view.viewWithTag(203) as! UIButton
        let btn5 = self.view.viewWithTag(204) as! UIButton
        let btn6 = self.view.viewWithTag(205) as! UIButton

        btn1.setTitle(NSLocalizedString("love", comment: ""), for: .normal)
        btn2.setTitle(NSLocalizedString("life", comment: ""), for: .normal)
        btn3.setTitle(NSLocalizedString("travel", comment: ""), for: .normal)
        btn4.setTitle(NSLocalizedString("create", comment: ""), for: .normal)
        btn5.setTitle(NSLocalizedString("privacy", comment: ""), for: .normal)
        btn6.setTitle(NSLocalizedString("other", comment: ""), for: .normal)
    }
    
    func setMotionType() {
        for i in 300...309 {
            let btn = self.view.viewWithTag(i) as! UIButton
            if i == 300 {
                btn.setTitle(NSLocalizedString("like", comment: ""), for: .normal)
            }
            else if i == 301 {
                btn.setTitle(NSLocalizedString("hate", comment: ""), for: .normal)
            }
            else if i == 302 {
                btn.setTitle(NSLocalizedString("anger", comment: ""), for: .normal)
            }
            else if i == 303 {
                btn.setTitle(NSLocalizedString("fear", comment: ""), for: .normal)
            }
            else if i == 304 {
                btn.setTitle(NSLocalizedString("bad", comment: ""), for: .normal)
            }
            else if i == 305 {
                btn.setTitle(NSLocalizedString("cour", comment: ""), for: .normal)
            }
            else if i == 306 {
                btn.setTitle(NSLocalizedString("happy", comment: ""), for: .normal)
            }
            else if i == 307 {
                btn.setTitle(NSLocalizedString("peace", comment: ""), for: .normal)
            }
            else if i == 308 {
                btn.setTitle(NSLocalizedString("compli", comment: ""), for: .normal)
            }
            else if i == 309 {
                btn.setTitle(NSLocalizedString("multi", comment: ""), for: .normal)
            }
        }
    }
    
    func setSaveType() {
        for i in 500...502 {
            let btn = self.view.viewWithTag(i) as! UIButton
            if i == 500 {
                btn.setTitle(NSLocalizedString("upload_story", comment: ""), for: .normal)
            }
            else if i == 501 {
                btn.setTitle(NSLocalizedString("save_local", comment: ""), for: .normal)
            }
            else if i == 502 {
                btn.setTitle(NSLocalizedString("re_record", comment: ""), for: .normal)
            }
        }
    }
    
    
    @IBAction func changeLangBtn(_ sender:UIButton) {
        for i in 100...102 {
            let btn = self.view.viewWithTag(i) as! UIButton
            self.setLanguageBtnStatus(flag: false, sender: btn)
        }
        self.setLanguageBtnStatus(flag: true, sender: sender)
    }
    
    @IBAction func changeStoryType(_ sender:UIButton) {
        for i in 200...205 {
            let btn = self.view.viewWithTag(i) as! UIButton
            self.setLanguageBtnStatus(flag: false, sender: btn)
        }
        self.setLanguageBtnStatus(flag: true, sender: sender)
    }
    
    func setLanguageBtnStatus(flag:Bool, sender:UIButton) {
        if flag {
            sender.setBackgroundImage(UIImage(named: "btnP1"), for: .normal)
            sender.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            sender.setBackgroundImage(UIImage(named: "btnW1"), for: .normal)
            sender.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
        }
    }
    
    @IBAction func changeMotionStatus(_ sender:UIButton) {
        for i in 300...309 {
            let btn = self.view.viewWithTag(i) as! UIButton
            self.setMotionBtnStatus(flag: false, sender: btn)
        }
        var name = "btnY"
        
        if sender.tag == 300 || sender.tag == 301 {
            name = "btnY"
        }
        else if sender.tag == 302 || sender.tag == 303 {
            name = "btnR"
        }
        else if sender.tag == 304 || sender.tag == 305 {
            name = "btnB"
        }
        else if sender.tag == 306 || sender.tag == 307 {
            name = "btnG"
        }
        else {
            name = "btnPur"
        }
        self.setMotionBtnStatus(flag: true, sender: sender, name:name)
    }
    
    func setMotionBtnStatus(flag:Bool, sender:UIButton, name:String = "btnW2") {
        if flag {
            sender.setBackgroundImage(UIImage(named: name), for: .normal)
            sender.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            sender.setBackgroundImage(UIImage(named: "btnW2"), for: .normal)
            sender.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
        }
    }
    
    @IBAction func changeSaveStatus(_ sender:UIButton) {
        for i in 500...502 {
            let btn = self.view.viewWithTag(i) as! UIButton
            self.setSaveBtnStatus(flag: false, sender: btn)
        }
        self.setSaveBtnStatus(flag: true, sender: sender)
        
        if sender.tag == 500 {
            let vc = UploadKnowledgeViewController()
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    func setSaveBtnStatus(flag:Bool, sender:UIButton) {
        if flag {
            sender.setBackgroundImage(UIImage(named: "btnP2"), for: .normal)
            sender.setTitleColor(UIColor.white, for: .normal)
        }
        else {
            sender.setBackgroundImage(UIImage(named: "btnW3"), for: .normal)
            sender.setTitleColor(Constants.getDefaultFontColor(), for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        field.resignFirstResponder()
        return true
    }
    
    @IBAction func dismissKey(){
        field.resignFirstResponder()
    }
    
}
