//
//  taskViewController.swift
//  HealthApp
//
//  Created by 박준하 on 2022/06/07.
//

import UIKit

class TaskViewController: UIViewController {

    
    @IBOutlet var lable: UILabel!
    
    var task : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lable.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
//
//        let newCount = count - 1
//
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
//
    }
    @IBAction func didTapAdd() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async {
                self.updateT asks()
                }
            }
        
        navigationController?.pushViewController(vc, animated: true )
    }
    
}
