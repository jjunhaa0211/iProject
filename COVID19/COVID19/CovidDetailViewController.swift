//
//  CovidDetailViewController.swift
//  COVID19
//
//  Created by 박준하 on 2022/08/11.
//

import UIKit

class CovidDetailViewController: UITableViewController {

//    신규 확진자
    @IBOutlet var newCaseCell: UITableViewCell!
//    확진자
    @IBOutlet var totalCaseCell: UITableViewCell!
//    완차자
    @IBOutlet var recoveredCell: UITableViewCell!
//    사망자
    @IBOutlet var deathCell: UITableViewCell!
//    발생률
    @IBOutlet var percentageCell: UITableViewCell!
//    해외유입 신규 확진자
    @IBOutlet var overseasInflowCell: UITableViewCell!
//    지역발생 신규 확진자
    @IBOutlet var regionalOutbreakCell: UITableViewCell!
    
    var covidOverview: CovidoverView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        guard let covidOverview = covidOverview else { return }
        self.title = covidOverview.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death)명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)%"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverview.newFcase)명"
        self.regionalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase)명"
    }
}
