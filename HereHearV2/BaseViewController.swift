//
//  BaseViewController.swift
//  supercaer
//
//  Created by Frank Liu on 2019/5/28.
//  Copyright © 2019 Frank Liu. All rights reserved.
//

import UIKit
import AVFoundation

class BaseViewController: UIViewController {

    var myAudio: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backToHome() {
        self.navigationController?.popToViewController(homeVC, animated: true)
    }
    
    func playAudioFile(filename:String, type:String) {
        DispatchQueue.main.async {
            let path = Bundle.main.path(forResource: filename, ofType: type)!
            let url = URL(fileURLWithPath: path)
            do {
                let sound = try AVAudioPlayer(contentsOf: url)
                self.myAudio = sound
                sound.play()
            } catch {
                
            }
        }
    }
    
    func stopAudioFile() {
        DispatchQueue.main.async {
            if self.myAudio != nil {
                self.myAudio.stop()
                self.myAudio = nil
            }
        }
    }
}
