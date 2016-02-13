#!/usr/bin/swift

import Foundation

func makeGetCall( completion: NSData? -> Void) -> Void {
    let
    url = NSURL(string: "https://httpbin.org/get")!,
    request = NSURLRequest(URL: url),
    session = NSURLSession.sharedSession(),
    semaphore = dispatch_semaphore_create(0)
    
    let task = session.dataTaskWithRequest(request) {
        (data, response, error) -> Void in
        
        if error == nil {
            completion(data)
        } else {
            completion(nil)
        }
        dispatch_semaphore_signal(semaphore)
    }
    task.resume()
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
}



func parseResponse(  data: NSData) -> AnyObject? {
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        return json
    } catch {
        // died parsing the JSON
    }
    return nil
}

makeGetCall() {data in
    if let
        priceData = data,
        price = parseResponse(  priceData) {
            print(price)
    } else {
        print("There was an error retrieving current price data.")
    }
}


