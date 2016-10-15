//
//  Issue.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import SwiftyJSON

struct HBIssue {
  let studentID: String
  let departmentID: String
  let title: String
  let content: String
  
  var created_at: String?
  var status: String?
  
  init(studentID: String, departmentID: String, title: String, content: String
) {
    self.studentID = studentID
    self.departmentID = departmentID
    self.title = title
    self.content = content
  }
  
  init(json: JSON) {
    self.studentID = json["student_id"].stringValue
    self.departmentID = json["dept_id"].stringValue
    self.created_at = json["created_at"].stringValue
    self.title = json["title"].stringValue
    self.content = json["body"].stringValue
    self.status = json["status"].stringValue
  }
}
