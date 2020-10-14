//
//  UserDefaultsHelper.swift
//  Macro43
//
//  Created by Toriq Wahid Syaefullah on 07/10/20.
//
import Foundation

class UserDefaultsHelper {
    static func setData<T>(value: T, key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key.rawValue)
    }
    
    static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
        let defaults = UserDefaults.standard
        let value = defaults.object(forKey: forKey.rawValue) as? T
        return value
    }
    
    static func removeData(key: UserDefaultKeys) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: key.rawValue)
    }
}

enum UserDefaultKeys: String, CaseIterable {
    case userName
    case themeColor
}
