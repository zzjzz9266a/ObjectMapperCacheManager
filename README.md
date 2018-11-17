<p align="center">
    <a href="https://github.com/zzjzz9266a/ObjectMapperCacheManager"><img src="https://github.com/zzjzz9266a/ObjectMapperCacheManager/blob/master/logo.png"></a>
</p>
<p align="center">
  <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
  <img src="https://img.shields.io/badge/Pod-v2.7-blue.svg?style=flat">
  <img src="https://img.shields.io/badge/Platform-iOS-4BC51D.svg?style=flat">
</p>
<!--<p align="center">A Light-Weight Tool For Cache, based on <a href="https://github.com/tristanhimmelman/ObjectMapper">ObjectMapper</a></p>-->

[中文简介](https://github.com/zzjzz9266a/ObjectMapperCacheManager/blob/master/README_CN.md)

## Installation
### Cocoapods
```
pod 'ObjectMapperCacheManager'
```

## Usage
When store something to a device, "key" is the only identifier, just like `UserDefaults` in `Foundation`.

``` swift
UserDefaults.standard.setValue(["name": "James", "age": 16], forKey: "User")
```
But, the difference between `UserDefaults` and `CacheManager` is the directory in sandbox:
* `UserDefaults`: Home/Library/Preference/  

* `CacheManager`: Home/Library/Caches

### 1. Store key-value data
The data could be a dict or an array

``` swift
let dict: [String: Any] = ["name": "James", "age": 16]
CacheManager.setCache(json: dict, for: "Json")

let dictArray = [[String: Any]] = [dict]
CacheManager.setCache(json: dictArray, for: "JsonArray")
```

### 2. Get cached key-value data
``` swift
// must declare the type
if let dict: [String: Any] = CacheManager.cacheJson(for: "Json") as? [String: Any]{  
  print(dict)
}

if let array: [[String: Any]] = CacheManager.cacheJson(for: "JsonArray") as? [String: Any]{  
  print(array)
}
```

### 3. Store an object or an array of ObjectMapper
The only requirement is that the object must conform to ObjectMapper's `Mappable` protocol.

``` swift
let user: User = User()
CacheManager.setCache(object: user, for: "Object")

let userList = [user]
CacheManager.setCache(array: userList, for: "ObjectArray")
```
### 4. Get cached object of array

``` swift
if let user: User = CacheManager.cache(for: "Object") {
    //use data
}

if let array: [User] = CacheManager.cacheArray(for: "ObjectArray") {
    //use data
}

```

## License
`ObjectMapperCacheManager` is released under an MIT license. See LICENSE for more information.
