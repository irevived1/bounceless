//
//  HBDetailViewController.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import UIKit

class HBDetailViewController: UIViewController, HBMessage {
  
  var issue: HBIssue?
  
  @IBOutlet weak var studentIDLabel: UILabel!
  @IBOutlet weak var departmentIDLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentLabel: UITextView!
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      if let issue = issue {
        studentIDLabel.text = issue.studentID
        departmentIDLabel.text = issue.departmentID
        statusLabel.text = issue.status
        titleLabel.text = issue.title
        contentLabel.text = issue.content
      } else {
        snackMessage("Failed to create the issue")
      }
    }
  
  @IBAction func onDoneClick(_ sender: UIBarButtonItem) {
    _ = navigationController?.popToRootViewController(animated: true);
  }
  
}
