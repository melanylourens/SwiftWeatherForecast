//
//  BlurLoader.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/08/05.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit

extension UIView {
    func showBlurLoader() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.startAnimating()
        
        blurEffectView.contentView.addSubview(activityIndicator)
        activityIndicator.center = blurEffectView.contentView.center
        
        self.addSubview(blurEffectView)
    }
    
    func removeBlurLoader() {
        DispatchQueue.main.async {
            self.subviews.compactMap { $0 as? UIVisualEffectView }.forEach {
                $0.removeFromSuperview()
            }
        }
    }
}
