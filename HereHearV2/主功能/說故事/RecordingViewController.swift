//
//  PrepareRecordViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/15.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class RecordingViewController: BaseViewController {
   
    @IBOutlet weak var titlStr: UILabel!
    @IBOutlet weak var tabBarView:UIView!
    @IBOutlet weak var bgImageView:UIImageView!
    @IBOutlet weak var btnRecString:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titlStr.text = NSLocalizedString("tab3Str", comment: "")
        self.btnRecString.setTitle(NSLocalizedString("click_finish", comment: ""), for: .normal)
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
    
    @IBAction func doPlay() {
        let vc = PlayRecordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
