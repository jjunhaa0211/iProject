//
//  ViewController.swift
//  COVID19
//
//  Created by 박준하 on 2022/08/11.
//

import UIKit
import Alamofire
import Charts

class ViewController: UIViewController {

    @IBOutlet var totalCaseLable: UILabel!
    
    @IBOutlet var newCaseLable: UILabel!
    @IBOutlet var pieChartView: PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchCovidOverview(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                self.configureStackView(koreaCovidOverview: result.korea)
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    func configureStackView(koreaCovidOverview: CovidoverView){
        self.totalCaseLable.text = "\(koreaCovidOverview.totalCase)명"
        self.newCaseLable.text = "\(koreaCovidOverview.newCase)"
    }
    
    func fetchCovidOverview(
        completionHandler: @escaping (Result<CityCovidOverview, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey" : "iWsYGOnjaSZRPDqgUxF17I48EN9b3Arhl"
        ]
        AF.request(url, method: .get, parameters: param)
            .responseData { response in
                switch response.result {
                case let .success(date):
                    do {
                       let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverview.self, from : date)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                case let .failure(error):
                    completionHandler(.failure(error))
                }
        }
    }
}

