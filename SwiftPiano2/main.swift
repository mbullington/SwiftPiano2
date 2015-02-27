//
//  main.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/4/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

/*
    TODO: Make purple overlay fade out. Replace true/false in SharedValues.swift with a countdown timer.
    TODO: Improve/Rewrite piano renderer, make it more than one octave.
    TODO: Add little octave slider thingy on top. Use Yosemite button design.
    TODO: Adjust keyboard input and MIDI output to match little octave slider thingy.
    TODO: Make dialog on first launch, telling how it needs a MIDI program like Garageband to work.
*/

import Cocoa
import Foundation

println("Welcome to SwiftPiano! You'll need a MIDI-compatible program, such as Garageband, for the piano to work correctly!")
NSApplicationMain(C_ARGC, C_ARGV)
