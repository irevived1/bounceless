//
//  HBHTTPService.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import Foundation
import SwiftyJSON

enum HBResult<T> {
  case success(T)
  case failure(Error)
}

extension HBResult {
  func resolve() throws -> T {
    switch self {
    case .success(let data): return data
    case .failure(let error): throw error
    }
  }
}

enum HBHTTPError: Error {
  case failed
}

enum HBDataParserError: Error {
  case noData
}

typealias GetDepartmentDone = (HBResult<[[String: String]]>) -> Void
typealias CreateIssueDone = (HBResult<HBIssue>) -> Void

protocol HBHTTPService {
  func getDepartments(_ completion: @escaping GetDepartmentDone )
  func createIssue(_ issue: HBIssue, completion: @escaping CreateIssueDone )
}

final class HTTPService: HBHTTPService {
  private lazy var defaultSession: URLSession = {
    let defaultConfiguration = URLSessionConfiguration.default
    let session = URLSession(configuration: defaultConfiguration)
    return session
  }()
  
  func getDepartments(_ completion: @escaping GetDepartmentDone) {
    let queue = DispatchQueue.global(qos: .background)
    
    queue.async { [unowned unownedSelf = self] in
      if let url = URL(string: Constant.Server.base + Constant.Server.departments) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        (unownedSelf.defaultSession.dataTask(with: request) { (data, response, error) in
          if let error = error {
            completion(HBResult.failure(error))
          }
          
          if let httpResponse = response as? HTTPURLResponse {
            guard httpResponse.statusCode < 300 else {
              return completion(HBResult.failure(HBHTTPError.failed))
            }
          }
          
          let jsonData = JSON(data: data!)
          if let arr = jsonData.array {
            var departments: [[String: String]] = []
            for department in arr {
              departments.append([
                "name": department["name"].stringValue,
                "id": department["id"].stringValue
              ])
            }
            
            completion(HBResult.success(departments))
          } else {
            completion(HBResult.failure(HBDataParserError.noData))
          }
        }).resume()
      }
    }
  }
  
  func createIssue(_ issue: HBIssue, completion: @escaping CreateIssueDone ) {
    let queue = DispatchQueue.global(qos: .background)
    
    queue.async { [unowned unownedSelf = self] in
      if let url = URL(string: Constant.Server.base + Constant.Server.issues) {
        let newIssue = ["title": issue.title,
                        "body": issue.content,
                        "student_id": issue.studentID,
                        "dept_id": issue.departmentID
        ]
        
        var request = URLRequest(url: url)
        request.httpBody = try? JSONSerialization.data(withJSONObject: newIssue, options: [])
        request.httpMethod = "POST"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        (unownedSelf.defaultSession.dataTask(with: request) { (data, response, error) in
          
          if let error = error {
            completion(HBResult.failure(error))
          }
          
          if let httpResponse = response as? HTTPURLResponse {
            guard httpResponse.statusCode < 300 else {
              return completion(HBResult.failure(HBHTTPError.failed))
            }
          }
          guard let _ = data else {
            return completion(HBResult.failure(HBDataParserError.noData))
          }
          
          let jsonData = JSON(data: data!)
          let issueCreated = HBIssue(json: jsonData)
          completion(HBResult.success(issueCreated))
        }).resume()
      }
    }
  }
}
