//
//  textViewController.swift
//  TBV+Text
//
//  Created by Saravana on 08/05/21.
//

import UIKit

protocol addDataDelegate {
    func addData(saveDatas: Data)
}


class textViewController: UIViewController {
    
    var delegate: addDataDelegate?
    
    
    @IBOutlet var textField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add the Data here"
        view.backgroundColor = .systemPink
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        view.addSubview(textField)
        textField.placeholder = "fullname"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.becomeFirstResponder()
       //self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))

//

        
    }
    

   
    // MARK: - Navigation
    @objc func handleDone() {
        
//        print("handle done..")
        guard let textname = textField.text, textField.hasText else{
            print("handle error here..")
            return
        
        }
        
        let contact = Data(fullname: textname)
        print(contact.fullname)
        delegate?.addData(saveDatas: contact)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func handleCancel() {
        self.dismiss(animated: true, completion: nil)
        
    }
}

