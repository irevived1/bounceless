//
//  ViewController.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import UIKit

class HBCreateViewController: UIViewController {

  @IBOutlet weak var pickerView: UIPickerView!
  @IBOutlet weak var studentIDTextField: UITextField!
  
  var pickerData: [[String:String]] = []
  
  lazy var httpService: HBHTTPService = HTTPService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.pickerView.delegate = self
    self.pickerView.dataSource = self
    httpService.getDepartments { (result) in
      do {
        let departments = try result.resolve()
        DispatchQueue.main.async { [unowned me = self] in
          me.pickerData = departments
          me.pickerView.reloadAllComponents()
        }
      } catch {
        print(error)
      }
    }
  }
  
  
  @IBAction func onCreateIssueBtnClick(_ sender: UIButton) {
    performSegue(withIdentifier: Constant.Segues.ToSubmitPage, sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var destination = segue.destination
    if let navCon = destination as? UINavigationController {
      destination = navCon.visibleViewController!
    }
    
    if let identifier = segue.identifier {
      switch identifier {
      case Constant.Segues.ToSubmitPage:
        if let submitCV = destination as? HBSubmitViewController {
          submitCV.studentID = studentIDTextField.text!
          submitCV.department = pickerData[pickerView.selectedRow(inComponent: 0)]
          submitCV.httpService = HTTPService()
        }
      default:
        break
      }
    }
  }
}





extension HBCreateViewController: UIPickerViewDelegate, UIPickerViewDataSource {

  // The number of columns of data
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // The number of rows of data
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
  }
  
  // The data to return for the row and component (column) that's being passed in
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]["name"]
  }
}

