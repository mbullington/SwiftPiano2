//
//  AppDelegate.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/4/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

import Cocoa
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window : PianoWindow?
    @IBOutlet var toolbar : NSToolbar?
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        PianoAudioInit()
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }
    
}
