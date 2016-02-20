//
//  RequestSpec.swift
//  NewsApp
//
//  Created by TanakaJun on 2016/02/20.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import Foundation


import Quick
import Nimble
import Alamofire
import AlamofireObjectMapper
import OHHTTPStubs
import Result

@testable import NewsApp

class RequestsSpec: QuickSpec {
    
    var res: Alamofire.Response<FeedResponse, NSError>? = nil
    var anonymousRes: Alamofire.Response<String, NSError>? = nil
    var isSuccess: Bool!
    var url = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://menthas.com/top/rss"
    
    override func spec() {
        describe("API request") {
            
            context("when you request \(self.url)") {
                it("should return JSON") {
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        Alamofire.request(.GET, self.url).responseObject("responseData") { (response: Alamofire.Response<FeedResponse, NSError>) in
                            self.isSuccess = response.result.isSuccess
                            print("###")
                            print(response)
                            print(response.result.value)
                        }
                        
                    }
                    expect(self.res?.result.value).toEventuallyNot(beNil())
                    expect(self.res?.result.value?.feed?.entries).toEventuallyNot(beNil())
                    
                    expect(self.res?.result.value?.feed?.entries?.first?.title).toEventuallyNot(beNil())
                    expect(self.res?.result.value?.feed?.entries?.first?.link).toEventuallyNot(beNil())
                    expect(self.res?.result.value?.feed?.entries?.first?.description).toEventuallyNot(beNil())
                }
            }
        }
        
        describe("the request") {
            it("needs to make a request") {
                
                stub(isHost("httpbin.org")) { _ in
                    let stubData = "Hello World!".dataUsingEncoding(NSUTF8StringEncoding)
                    return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
                }
                
                print("@@Start")
                Alamofire.request(.GET, "http://httpbin.org/get", parameters: ["foo": "bar"])
                    .responseString() { response in
                        print("###")
                        self.anonymousRes = response
                }
                
                expect(self.anonymousRes?.result.value).toEventuallyNot(beNil(), timeout: 3)
                print("@@End")
            }
        }

    }
}