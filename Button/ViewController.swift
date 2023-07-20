//
//  ViewController.swift
//  Button
//
//  Created by Siva Mouniker  on 26/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstView: UIView!
    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = btn1.frame.height / 2
                btn1.layer.masksToBounds = true
                btn1.clipsToBounds = true
                btn1.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
}


extension CAGradientLayer {
    enum Point {
        case topLeft
        case centerLeft
        case bottomLeft
        case topCenter
        case center
        case bottomCenter
        case topRight
        case centerRight
        case bottomRight
        var point: CGPoint {
            switch self {
                case .topLeft:
                    return CGPoint(x: 0, y: 0)
                case .centerLeft:
                    return CGPoint(x: 0, y: 0.5)
                case .bottomLeft:
                    return CGPoint(x: 0, y: 1.0)
                case .topCenter:
                    return CGPoint(x: 0.5, y: 0)
                case .center:
                    return CGPoint(x: 0.5, y: 0.5)
                case .bottomCenter:
                    return CGPoint(x: 0.5, y: 1.0)
                case .topRight:
                    return CGPoint(x: 1.0, y: 0.0)
                case .centerRight:
                    return CGPoint(x: 1.0, y: 0.5)
                case .bottomRight:
                    return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    convenience init(start: Point, end: Point, colors: [CGColor], type: CAGradientLayerType) {
        self.init()
        self.startPoint = start.point
        self.endPoint = end.point
        self.colors = colors
        self.locations = (0..<colors.count).map(NSNumber.init)
        self.type = type
    }
    
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
let gold = UIColor(hex: "#ffe700ff")

