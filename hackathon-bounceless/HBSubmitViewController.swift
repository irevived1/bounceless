//
//  SubmitViewController.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import UIKit

class HBSubmitViewController: UIViewController {
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var contetnTextView: UITextView!
  var studentID: String = ""
  var department: [String:String] = [String:String]()
  
  var httpService: HBHTTPService!
  
  @IBAction func onSubmitBtnClicked(_ sender: UIButton) {
    let issue = HBIssue(studentID: studentID, departmentID: department["id"]!, title: titleTextField.text!, content: contetnTextView.text!)
    httpService.createIssue(issue) { (result) in
      do {
        let issueCreated = try result.resolve()
        DispatchQueue.main.async { [unowned me = self] in
          me.performSegue(withIdentifier: Constant.Segues.ToDetailPage, sender: issueCreated)
        }
      } catch {
        print(error)
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    var destination = segue.destination
    if let navCon = destination as? UINavigationController {
      destination = navCon.visibleViewController!
    }
    
    if let identifier = segue.identifier {
      switch identifier {
      case Constant.Segues.ToDetailPage:
        if let detailVC = destination as? HBDetailViewController {
          detailVC.issue = sender as? HBIssue
        }
      default:
        break
      }
    }
  }
}
