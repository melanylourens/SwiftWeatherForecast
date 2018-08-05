//
//  BlurError.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/08/05.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit

extension UIView {
    func showBlurError(_ error: String) {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        label.textAlignment = .center
        label.textColor = .white
        label.text = error
        label.sizeToFit()
        
        blurEffectView.contentView.addSubview(label)
        label.center = blurEffectView.contentView.center
        
        self.addSubview(blurEffectView)
    }
    
    func removeBlurError() {
        DispatchQueue.main.async {
            self.subviews.compactMap { $0 as? UIVisualEffectView }.forEach {
                $0.removeFromSuperview()
            }
        }
    }
}
