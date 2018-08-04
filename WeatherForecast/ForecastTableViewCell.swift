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
            if let weekday = self.getDayOfTheWeek(dayForecast.date) {
                self.weekdayLabel.text = weekday
            }             
            self.tempImage?.image = UIImage(named: dayForecast.weather[0].type.lowercased())
            self.tempLabel.text = String(format: "%.0f\u{00B0}", dayForecast.temp.max.rounded())
        }
    }
    
    private func getDayOfTheWeek(_ day:String) -> String? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        guard let dayDate = formatter.date(from: day) else { return nil }
        formatter.dateFormat = "EEEE"
        return formatter.string(from: dayDate).capitalized
    }
    
}
