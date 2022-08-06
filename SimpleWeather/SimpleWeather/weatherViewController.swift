//
//  weatherViewController.swift
//  SimpleWeather
//
//  Created by 박준하 on 2022/08/06.
//

import UIKit

class weatherViewController: UIViewController {

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherImageView: UIImageView!
    @IBOutlet var temperatureLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    let cities = ["Seoul","Tokyo","LA","Seattle"]
    let weathers = ["cloud.fill",
                    "sun.max.fill",
                    "wind",
                    "cloud.sun.rain.fill"]
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        
        cityLabel.text = cities.randomElement()!
        
        let imageName = weathers.randomElement()
        weatherImageView.image = UIImage(systemName: imageName!)?.withRenderingMode(.alwaysOriginal)
        
        let randomTemp = Int.random(in: 10..<30)
        temperatureLable.text = "\(randomTemp)"
        print("도시, 온도, 날씨이미지 변경")
    }
}
