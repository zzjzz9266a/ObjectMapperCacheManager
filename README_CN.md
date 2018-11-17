## 安装
### Cocoapods
```
pod 'ObjectMapperCacheManager'
```

## 使用方法
把数据存到设备上时，`key`是唯一标识，与`UserDefaults`使用方法类似。

``` swift
UserDefaults.standard.setValue(["name": "James", "age": 16], forKey: "User")
```
与`UserDefaults`唯一的不同之处在于存放在沙盒中的路径：
* `UserDefaults`的存放路径为`Home/Library/Preference/`  
* `ObjectMapperCacheManager`的存放路径为`Home/Library/Caches`

#### 1. 存储`key-value`类型
数据格式可以是字典或数组：

``` swift
let dict: [String: Any] = ["name": "James", "age": 16]
CacheManager.setCache(json: dict, for: "Json")

let dictArray = [[String: Any]] = [dict]
CacheManager.setCache(json: dictArray, for: "JsonArray")
```

#### 2. 获取`key-value`类型
``` swift
// 需显式声明类型
if let dict: [String: Any] = CacheManager.cacheJson(for: "Json") as? [String: Any]{  
  //print(dict)
}

if let array: [[String: Any]] = CacheManager.cacheJson(for: "JsonArray") as? [String: Any]{  
  //print(array)
}
```

#### 3. 存储`ObjectMapper`类型的对象或对象数组
储存对象的类型需遵从`ObjectMapper`中的`Mapple`协议：

``` swift
let user: User = User()
CacheManager.setCache(object: user, for: "Object")

let userList = [user]
CacheManager.setCache(array: userList, for: "ObjectArray")
```
#### 4. 获取`ObjectMapper`类型的对象或对象数组

``` swift
// 需显式声明类型
if let user: User = CacheManager.cache(for: "Object") {
  //Do Something
}

if let array: [User] = CacheManager.cacheArray(for: "ObjectArray") {
  //Do Something
}

```

## License
`ObjectMapperCacheManager` 遵循 `MIT` 开源协议， 详见[License](https://github.com/zzjzz9266a/ObjectMapperCacheManager/blob/master/LICENSE).
