//
//  UploadKnowledgeViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/16.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class UploadKnowledgeViewController: BaseViewController {
    
    @IBOutlet weak var labTitle:UILabel!
    @IBOutlet weak var txtView:UITextView!
    @IBOutlet weak var btn:UIButton!
    @IBOutlet weak var check:UIButton!
    @IBOutlet weak var lab:UILabel!
    var flag = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUserInterface()
        self.view.isOpaque = false
    }
    
    func setUserInterface() {
        self.labTitle.text = NSLocalizedString("userAgree", comment: "")
        self.txtView.text = NSLocalizedString("userAgreeContent", comment: "")
        self.btn.setTitle(NSLocalizedString("confirm", comment: ""), for: .normal)
        self.lab.text = NSLocalizedString("understand", comment: "")
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
    
    @IBAction func closeView(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func next(){
        self.dismiss(animated: false) {
            NotificationCenter.default.post(name: Notification.Name("DoUpload"), object: nil)
        }
    }
}
