//
//  Constants.swift
//  tw.com.skl
//
//  Created by Frank Liu on 2019/4/30.
//  Copyright © 2019 Doing. All rights reserved.
//

import UIKit

class Constants: NSObject {
    static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    static func convertToArray(text: String) -> Array<Dictionary<String, String>>? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? Array<Dictionary<String, String>>
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    static func showAlert(vc:UIViewController, title:String, msg:String) {
        let controller = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        controller.addAction(okAction)
        vc.present(controller, animated: true, completion: nil)
    }
    
    static func getAppVersion() -> String {
        return (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
    }
    
    static func getFirstVideoPlayStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: "FirstVideoPlay")
    }
    
    static func setFirstVideoPlayStatus() {
        UserDefaults.standard.set(true, forKey: "FirstVideoPlay")
    }
    
    static func getDefaultFontColor() -> UIColor {
        return UIColor(displayP3Red: 102/255.0, green: 101/255.0, blue: 101/255.0, alpha: 1.0)
    }
    
    static func getPurpleColor() -> UIColor {
        return UIColor(displayP3Red: 105/255.0, green: 36/255.0, blue: 214/255.0, alpha: 1.0)
    }
    
    static func getScreenSize() -> (w:CGFloat, h:CGFloat) {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        return (width, height)
    }
}



extension UITableViewCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIDevice {
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
