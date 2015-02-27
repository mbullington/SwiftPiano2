//
//  PianoView.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/4/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

import Cocoa
import Quartz
import Foundation

class PianoView : NSView {
    
    override var mouseDownCanMoveWindow : Bool {
        get {
            return false
        }
    }
    
    override func drawRect(rect: NSRect) {
        var context : CGContext = NSGraphicsContext.currentContext().CGContext
                
        CGContextSetRGBFillColor(context, 0.72, 0.74, 0.7, 0.6)
        CGContextFillRect(context, CGRectMake(0, 0, 853, 5))
        
        // draw the black line inbetween keys.
        for var index : Int = 60; index <= 853; index += 61 {
            if index != 0 {
                CGContextSetRGBFillColor(context, 0.03, 0.03, 0.03, 0.9)
                CGContextFillRect(context, CGRectMake(CGFloat(index), 0, 1, 350))
            }
            var newIndex : Int = Int(floor((Double(index) / 60.0) as CDouble)) - 1
            if whiteKeys[whiteKeys.keys[newIndex]] == true {
                CGContextSetRGBFillColor(context, 0.4, 0.4, 0.8, 0.8)
                CGContextFillRect(context, CGRectMake(CGFloat(index - 60), 0, 60, 350))
            }
        }
        
        // now the black keys
        func getBlackKeyIndex(let index : Int) -> Int {
            if index == 0 {
                return 0
            }
            
            var returnedIndex : Int = 0
            var newIndex : Int = index
            while newIndex > 0 {
                returnedIndex += 5
                newIndex -= 7
            }
            if newIndex < 0 {
                returnedIndex -= 2
            }
            
            return returnedIndex
        }
        
        var swap : Int = 3
        func compareIndex() -> Int {
            swap = swap == 3 ? 4 : 3
            return swap
        }
        
        for var index : Int = 0; index < 14; index += swap {
            compareIndex()
            var x : Int = index * 61
            x += 30
            var blackKey = getBlackKeyIndex(index)
            for index2 in 0...(swap - 2) {
                
                
                if blackKeys[blackKeys.keys[blackKey + index2]] == true {
                    CGContextSetRGBFillColor(context, 0.2, 0.2, 0.43, 1)
                } else {
                    CGContextSetRGBFillColor(context, 0.13, 0.13, 0.13, 1)
                }
                
                CGContextFillRect(context, CGRectMake(CGFloat(x + (61 * index2)), 130, 60, 220))
                
                if blackKeys[blackKeys.keys[blackKey + index2]] == true {
                    CGContextSetRGBFillColor(context, 0.14, 0.14, 0.3, 1)
                } else {
                    CGContextSetRGBFillColor(context, 0.02, 0.02, 0.02, 1)
                }
                
                CGContextFillRect(context, CGRectMake(CGFloat(x + (61 * index2)), 125, 60, 5))
            }
        }
                
    }
    
}




