//
//  UploadProcessViewController.swift
//  HereHearV2
//
//  Created by Frank Liu on 2019/6/16.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit

class UploadProcessViewController: BaseViewController {

    @IBOutlet weak var labUploading:UILabel!
    @IBOutlet weak var labProgress:UILabel!
    var timer:Timer!
    var value:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.labUploading.text = NSLocalizedString("uploading", comment: "")
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (time) in
            self.value += 20
            self.labProgress.text = String(format: "%d%%", self.value)
            if self.value == 100 {
                self.timer.invalidate()
                let vc = CompleteUploadViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
}
