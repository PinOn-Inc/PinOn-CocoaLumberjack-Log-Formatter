/*
 
 Copyright (c) 2017 PinOn, Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 Created by Kefei Qian on 4/18/17.
 
*/

import Foundation
import CocoaLumberjack

final class PinOnCocoaLumberjackLogFormatter: NSObject, DDLogFormatter {
  
  private var dateFormatter: DateFormatter = {
    let df = DateFormatter()
    df.formatterBehavior = .behavior10_4
    df.dateFormat = "HH:mm:ss.SSS"
    return df
  }()
  
  func format(message logMessage: DDLogMessage) -> String? {
    let dateAndTime = dateFormatter.string(from: logMessage.timestamp)
    
    var logLevel: String
    var logIcon: String
    var useLog = true
    let logFlag: DDLogFlag = logMessage.flag
    
    if logFlag.contains(.verbose) {
      logLevel = "VERBOSE"
      logIcon = "😘"
    } else if logFlag.contains(.debug) {
      logLevel = "DEBUG"
      logIcon = "🤔"
    } else if logFlag.contains(.info) {
      logLevel = "INFO"
      logIcon = "ℹ️️"
    } else if logFlag.contains(.warning) {
      logLevel = "WARNING"
      logIcon = "⚠️️"
    } else if logFlag.contains(.error) {
      logLevel = "ERROR"
      logIcon = "🚫"
    } else {
      logLevel = "OFF"
      logIcon = ""
      useLog = false
    }
    
    var formattedLog: String?
    
    if useLog {
      formattedLog = "\(dateAndTime) \(logIcon) \(logLevel) [\(logMessage.fileName).\(logMessage.function!)] #\(logMessage.line): \(logMessage.message)"
    }
    
    return formattedLog
  }
}

