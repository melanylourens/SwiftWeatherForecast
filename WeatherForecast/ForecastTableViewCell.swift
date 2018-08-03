//
//  ForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Melany Lourens on 2018/08/03.
//  Copyright © 2018 Melany Lourens. All rights reserved.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(dayForecast: ForecastList) {
        DispatchQueue.main.async {
            self.weekdayLabel.text = dayForecast.date
            self.imageView?.image = UIImage(named: dayForecast.weather.description)
            self.tempLabel.text = String(format: "%.0f\u{00B0}", dayForecast.temp.current.rounded())
        }
    }
    
}
