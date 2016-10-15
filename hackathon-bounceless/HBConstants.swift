//
//  HBConstants.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//
import UIKit

struct Constant {
  struct Segues {
    static let ToSubmitPage = "ToSubmitPage"
    static let ToDetailPage = "ToDetailPage"
  }
  
  struct Server {
    static let base: String = "http://localhost:3000"
    static let departments: String = "/student/issues/departments.json"
    static let issues: String = "/issues.json"
  }
  
  struct Color {
    static let global = UIColor(red: 1.0/255.0, green: 87.0/255.0, blue: 155.0/255.0, alpha: 1.0)//UIColor(red: 234.0/255.0, green: 46.0/255.0, blue: 73.0/255.0, alpha: 1.0)
  }
}
