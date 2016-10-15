//
//  HBMessage.swift
//  hackathon-bounceless
//
//  Created by GaoYuan on 10/15/16.
//  Copyright © 2016 YuanGao. All rights reserved.
//

import TTGSnackbar

protocol HBMessage {}

extension HBMessage {
  func snackMessage(_ message: String) {
    DispatchQueue.main.async {
      let snackbar = TTGSnackbar.init(message: message, duration: .middle)
      snackbar.animationType = .slideFromTopBackToTop
      snackbar.show()
    }
  }
}
