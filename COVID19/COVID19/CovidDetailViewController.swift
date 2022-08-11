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
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
