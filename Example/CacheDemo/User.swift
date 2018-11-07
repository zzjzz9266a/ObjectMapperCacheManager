//
//  User.swift
//  CacheDemo
//
//  Created by zhangzhijie on 2018/11/7.
//  Copyright © 2018 zhangzhijie. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {
    
    var username: String = ""
    var identifier: String?
    var photoCount: Int = 0
    var age: Int?
    var weight: Double?
    var float: Float?
    var drinker: Bool = false
    var smoker: Bool?
    
    var canDrive: Bool?
    var arr: [Any] = []
    var arrOptional: [Any]?
    var dict: [String : Any] = [:]
    var dictOptional: [String : Any]?
    var dictString: [String : String]?
    var friendDictionary: [String : User]?
    var friend: User?
    var friends: [User]? = []
    
    init(){
        
    }
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        username         <- map["username"]
        identifier       <- map["identifier"]
        photoCount       <- map["photoCount"]
        age              <- map["age"]
        weight           <- map["weight"]
        float            <- map["float"]
        drinker          <- map["drinker"]
        smoker           <- map["smoker"]
        
        canDrive         <- map["canDrive"]
        arr              <- map["arr"]
        arrOptional      <- map["arrOpt"]
        dict             <- map["dict"]
        dictOptional     <- map["dictOpt"]
        friend           <- map["friend"]
        friends          <- map["friends"]
        friendDictionary <- map["friendDictionary"]
        dictString         <- map["dictString"]
    }
}

enum Sex: String {
    case Male = "Male"
    case Female = "Female"
}
