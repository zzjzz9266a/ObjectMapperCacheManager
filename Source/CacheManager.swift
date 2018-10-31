//
//  CacheManager.swift
//  ObjectMapperCacheManager
//
//  Created by zhangzhijie on 2018/10/31.
//  Copyright © 2018年 zhangzhijie. All rights reserved.
//

import Foundation
import ObjectMapper

class CacheManager {
    
    //path for cache file
    static private func filePath(_ fileName:String) -> URL?{
        let manager = FileManager.default
        guard let cachePath = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        let directory = cachePath.appendingPathComponent("ObjectMapperCache")
        if !manager.fileExists(atPath: directory.path){
            do{
                try manager.createDirectory(atPath: directory.path, withIntermediateDirectories: true, attributes: nil)
            }catch{
                return nil
            }
        }
        let path = directory.appendingPathComponent(fileName)
        return path
    }
    
    @discardableResult
    static public func setCache(object:BaseMappable, for fileName: String) -> Bool{
        return setCache(json: object.toJSON(), for: fileName)
    }
    
    /** declare like this,let a:Art = CacheManager.cache(for: "cacheName")
     refer to http://stackoverflow.com/questions/27965439/cannot-explicitly-specialize-a-generic-function */
    static public func cache<T: BaseMappable>(for fileName: String) -> T?{
        guard let jsonDict = cacheJson(for: fileName) as? [String: Any] else {return nil}
        return Mapper<T>().map(JSON: jsonDict)
    }
    
    //save as array
    @discardableResult
    static public func setCache(array: [BaseMappable], for fileName: String) -> Bool{
        return self.setCache(json: array.map({$0.toJSON()}), for: fileName)
    }
    
    //get array
    static public func cacheArray<T: BaseMappable>(for fileName: String) -> Array<T>?{
        guard let jsonArray = cacheJson(for: fileName) as? [[String: Any]] else {return nil}
        return Mapper<T>().mapArray(JSONArray: jsonArray)
    }
    
    //save as json
    @discardableResult
    static public func setCache(json: Any, for fileName: String) -> Bool{
        guard let filePath = filePath(fileName) else {return false}
        if let array = json as? [Any]{
            let jsonArray = NSArray(array: array)
            return jsonArray.write(to: filePath, atomically: true)
        }else if let dict = json as? [String: Any]{
            let jsonDict = NSDictionary(dictionary: dict)
            return jsonDict.write(to: filePath, atomically: true)
        }else {
            return false
        }
    }
    
    //get json
    static public func cacheJson(for fileName: String) -> Any?{
        guard let filePath = filePath(fileName) else {return nil}
        if let jsonArray = NSArray(contentsOf: filePath){
            return jsonArray
        }else if let jsonDict = NSDictionary(contentsOf: filePath){
            return jsonDict
        }else{
            return nil
        }
    }
}
