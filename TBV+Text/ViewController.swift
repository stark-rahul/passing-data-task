//
//  ViewController.swift
//  TBV+Text
//
//  Created by Saravana on 08/05/21.
//

import UIKit

struct Data {
    var fullname: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var saveDatas = [Data]()
    
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "savedata"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddData))
        
    }
    //mark: - Selectors
    @objc func handleAddData(){
        
        let controller = textViewController()
        controller.delegate = self
        
        self.present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveDatas.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = saveDatas[indexPath.row].fullname
        return cell
    }
}

extension ViewController: addDataDelegate {
    
    func addData(saveDatas: Data) {
        self.dismiss(animated: true) {
            self.saveDatas.append(saveDatas)
            self.table.reloadData()
        }
    }
}

