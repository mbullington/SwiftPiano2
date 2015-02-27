//
//  Extensions.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/5/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

import Cocoa
import Quartz
import Foundation

// I believe a Dictionary will have it's entries in random order. That's no fun.
class IndexedDictionary<KeyType : Hashable, ValueType> {
    var keys : [KeyType]
    var values : [ValueType]
    
    init(keyArray: [KeyType], valueArray : [ValueType]) {
        self.keys = Array(keyArray)
        self.values = Array(valueArray)
    }
    
    func indexForKey(key: KeyType) -> Int? {
        for (index, element) in enumerate(self.keys) {
            if key == element {
                return index
            }
        }
        return nil
    }
    
    func hasKey(key : KeyType) -> Bool {
        return self.indexForKey(key) != nil
    }
    
    subscript(key : KeyType) -> ValueType? {
        get {
            return self.values[self.indexForKey(key)!]
        }
        set(newValue) {
            self.values[self.indexForKey(key)!] = newValue!
        }
    }
}

extension Int {
    func getUnsignedInt() -> UInt32 {
        return UInt32(self)
    }
    
    func times(closure: () -> ()) {
        for index in 0...self {
            closure()
        }
    }
}