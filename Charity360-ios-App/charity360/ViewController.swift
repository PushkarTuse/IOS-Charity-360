//
//  ViewController.swift
//  charity360
//
//  Created by user1 on 29/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var participatedSegmentView: UIView!
    
    @IBOutlet weak var completedSegmentView: UIView!
    
    @IBOutlet weak var yourEventsSegmentView: UIView!
    
    @IBOutlet weak var account: UISegmentedControl!
    
    @IBOutlet weak var loginSegmentView: UIView!
    
    @IBOutlet weak var registerSegmentView: UIView!
    
    @IBOutlet weak var paymentField: UITextField!
    
    let methods = ["GPay", "PayTM", "PhonePe", "BHIM"]
    
    var methodPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //paymentField?.textAlignment = .center
        
        paymentField?.inputView = methodPickerView
        methodPickerView.delegate = self
        methodPickerView.dataSource = self
        
        methodPickerView.tag = 1
    }
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(participatedSegmentView)
        case 1:
            self.view.bringSubviewToFront(completedSegmentView)
        case 2:
            self.view.bringSubviewToFront(yourEventsSegmentView)
        default:
            break
        }
    }
    
    
    @IBAction func loginRegister(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(loginSegmentView)
        case 1:
            self.view.bringSubviewToFront(registerSegmentView)
        default:
            break
        }
    }
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return methods.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
          //
            return methods[row]
        default:
            return "Data not found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //paymentField.text = pickerView.textInputContextIdentifier
        switch pickerView.tag {
        case 1:
            paymentField.text = methods[row]
            paymentField.resignFirstResponder()
        default:
            return
        }
    }
}






