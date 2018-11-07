//
//  ViewController.swift
//  CacheDemo
//
//  Created by zhangzhijie on 2018/11/7.
//  Copyright © 2018 zhangzhijie. All rights reserved.
//

import UIKit
import ObjectMapper
import ObjectMapperCacheManager

class ViewController: UITableViewController {
    
    func objectSet(_ user: User) {
        if CacheManager.setCache(object: user, for: "Object") {
            alert(text: "Success")
        }
    }
    
    func jsonSet(_ json: Any) {
        if CacheManager.setCache(json: json, for: "Json") {
            alert(text: "Success")
        }
    }
    
    func arraySet(_ array: [User]) {
        if CacheManager.setCache(array: array, for: "Array") {
            alert(text: "Success")
        }
    }
    
    func objectGet() {
        if let object: User = CacheManager.cache(for: "Object") {
            DetailViewController.showDetail(text: object.toJSONString(prettyPrint: true), from: self)
//            alert(text: object.toJSONString())
//            print(object)
        }
    }
    
    func jsonGet() {
        if let dict = CacheManager.cacheJson(for: "Json") as? [String: Any] {
            if let user = Mapper<User>().map(JSONObject: dict){
                DetailViewController.showDetail(text: user.toJSONString(prettyPrint: true), from: self)
            }
//            DetailViewController.showDetail(text: dict.description, from: self)
        }
    }
    
    func arrayGet() {
        if let array: [User] = CacheManager.cacheArray(for: "Array") {
            DetailViewController.showDetail(text: array.toJSONString(prettyPrint: true), from: self)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: objectSet(user)
        case 1: arraySet([user])
        case 2: jsonSet(dict)
        case 3: objectGet()
        case 4: arrayGet()
        case 5: jsonGet()
        default:
            break
        }
    }
    
}

extension ViewController {
    var jsonString: String {
        let username = "John Doe"
        let identifier = "user8723"
        let photoCount = 13
        let age = 1227
        let weight = 123.23
        let float: Float = 123.231
        let drinker = true
        let smoker = false
        let sex: Sex = .Female
        let subUserJSON = "{\"identifier\" : \"user8723\", \"drinker\" : true, \"age\": 17, \"username\" : \"sub user\" }"
        
        return "{\"username\":\"\(username)\",\"identifier\":\"\(identifier)\",\"photoCount\":\(photoCount),\"age\":\(age),\"drinker\":\(drinker),\"smoker\":\(smoker), \"sex\":\"\(sex.rawValue)\", \"arr\":[ \"bla\", true, 42 ], \"dict\":{ \"key1\" : \"value1\", \"key2\" : false, \"key3\" : 142 }, \"arrOpt\":[ \"bla\", true, 42 ], \"dictOpt\":{ \"key1\" : \"value1\", \"key2\" : false, \"key3\" : 142 }, \"weight\": \(weight), \"float\": \(float), \"friend\": \(subUserJSON), \"friendDictionary\":{ \"bestFriend\": \(subUserJSON)}}"
    }
    
    var dict: Any {
        return try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: [])
    }
    
    var user: User {
        return Mapper<User>().map(JSONObject: dict)!
    }
    
    func alert(text: String?) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

