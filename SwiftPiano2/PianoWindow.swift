//
//  PianoWindow.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/5/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

import Cocoa
import Foundation

class PianoWindow : NSWindow {
    
    func redrawPianoView() {
        var pianoView : NSView = self.contentView.subviews![0] as NSView
        var rect : NSRect = CGRectMake(0, 0, pianoView.frame.width, pianoView.frame.height)
        pianoView.setNeedsDisplayInRect(rect)
    }
    
    override func keyDown(event : NSEvent) {
        var key : Int = Int(event.keyCode)
        if !(whiteKeys.hasKey(key) || blackKeys.hasKey(key)) {
            super.keyUp(event)
        } else {
            if whiteKeys.hasKey(key) {
                if whiteKeys[key] != true {
                    whiteKeys[key] = true
                    PianoAudioPlayNote(whiteMidiCodes[whiteKeys.indexForKey(key)!]);
                }
            } else {
                if blackKeys[key] != true {
                    blackKeys[key] = true
                    PianoAudioPlayNote(blackMidiCodes[blackKeys.indexForKey(key)!]);
                }
            }
            redrawPianoView()
        }
    }
    
    override func keyUp(event: NSEvent) {
        var key : Int = Int(event.keyCode)
        if !(whiteKeys.hasKey(key) || blackKeys.hasKey(key)) {
            super.keyUp(event)
        } else {
            if whiteKeys.hasKey(key) {
                whiteKeys[key] = false
                PianoAudioStopNote(whiteMidiCodes[whiteKeys.indexForKey(key)!]);
            } else {
                blackKeys[key] = false
                PianoAudioStopNote(blackMidiCodes[blackKeys.indexForKey(key)!]);
            }
            redrawPianoView()
        }
    }
    
}
