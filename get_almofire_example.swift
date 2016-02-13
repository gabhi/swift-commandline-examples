#!/usr/bin/swift -F Carthage/Build/Mac/


import Alamofire
import SwiftyJSON


func parseResponse(){
    print("inside func")



/////////


var keepAlive = true





         Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
         .responseJSON { response in
             
              

             if let JSON = response.result.value {
                 print("JSON: \(JSON)")
             }
                          keepAlive = false

         }




let runLoop = NSRunLoop.currentRunLoop()
while keepAlive &&
    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: NSDate(timeIntervalSinceNow: 0.1)) {
    // Run, run, run
}

////////


         print("End")

}



parseResponse()
print("hello world")
