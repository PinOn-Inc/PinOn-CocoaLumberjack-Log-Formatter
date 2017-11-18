# PinOn-CocoaLumberjack-LogFormatter

A logger formater for CocoaLumberjack to provide a better recognizable log format.

## How to use
Copy the only swift file [PinOnCocoaLumberjackLogFormatter.swift](https://github.com/PinOn-Inc/PinOn-CocoaLumberjack-Log-Formatter/blob/master/PinOnCocoaLumberjackLogFormatter.swift) into your project, and in your `application:didFinishLaunchingWithOptions:`, add the following code to setup the logFormatter

```swift

DDTTYLogger.sharedInstance.logFormatter = PinOnCocoaLumberjackLogFormatter()
DDLog.add(DDTTYLogger.sharedInstance)

```

Don't forget to `import CocoaLumberjack`