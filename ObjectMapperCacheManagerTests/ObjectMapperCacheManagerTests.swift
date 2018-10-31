//
//  ObjectMapperCacheManagerTests.swift
//  ObjectMapperCacheManagerTests
//
//  Created by zhangzhijie on 2018/10/31.
//  Copyright © 2018年 zhangzhijie. All rights reserved.
//

import XCTest

@testable import ObjectMapperCacheManager
import ObjectMapper
//import ObjectMapper


class ObjectMapperCacheManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testJson(){
        let name: String = "Genghis khan"
        let UUID: String = "12345"
        let major: Int = 99
        let minor: Int = 1
        let json: [String: Any] = ["name": name, "UUID": UUID, "major": major, "minor": minor]
        CacheManager.setCache(json: json, for: "person")
        guard let result: [String: Any] = CacheManager.cacheJson(for: "person") as? [String : Any] else {
            XCTFail("can't get data of right type")
            return
        }
        XCTAssertEqual(result["name"] as? String, name)
        XCTAssertEqual(result["UUID"] as? String, UUID)
        XCTAssertEqual(result["major"] as? Int, major)
        XCTAssertEqual(result["minor"] as? Int, minor)
    }
    
    func testObject() {
        let name: String = "Genghis khan"
        let UUID: String = "12345"
        let major: Int = 99
        let minor: Int = 1
        let json: [String: Any] = ["name": name, "UUID": UUID, "major": major, "minor": minor]
        let user = Mapper<User>().map(JSON: json)
        XCTAssertEqual(name, user?.name)
    }
}

struct User: Mappable {
    var name: String?
    var UUID: String?
    var major: Int?
    var minor: Int?

    init(){}

    init?(map: Map){}

    mutating func mapping(map: Map) {
        name <- map["name"]
        UUID <- map["UUID"]
        major <- map["major"]
        minor <- map["minor"]
    }
}
