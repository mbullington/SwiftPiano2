//
//  SharedValues.swift
//  SwiftPiano
//
//  Created by Michael Bullington on 6/5/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

import Carbon

var whiteKeys : IndexedDictionary<Int, Bool> = IndexedDictionary(keyArray: [
    kVK_Tab,
    kVK_ANSI_Q,
    kVK_ANSI_W,
    kVK_ANSI_E,
    kVK_ANSI_R,
    kVK_ANSI_T,
    kVK_ANSI_Y,
    kVK_ANSI_U,
    kVK_ANSI_I,
    kVK_ANSI_O,
    kVK_ANSI_P,
    kVK_ANSI_LeftBracket,
    kVK_ANSI_RightBracket,
    kVK_ANSI_Backslash
], valueArray: [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
])

var whiteMidiCodes : [CInt] = [
    53,
    55,
    57,
    59,
    60,
    62,
    64,
    65,
    67,
    69,
    71,
    72,
    74,
    76
]

var blackKeys : IndexedDictionary<Int, Bool> = IndexedDictionary(keyArray: [
    kVK_ANSI_1,
    kVK_ANSI_2,
    kVK_ANSI_3,
    kVK_ANSI_5,
    kVK_ANSI_6,
    kVK_ANSI_8,
    kVK_ANSI_9,
    kVK_ANSI_0,
    kVK_ANSI_Equal,
    kVK_Delete
], valueArray: [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
])

var blackMidiCodes : [CInt] = [
    54,
    56,
    58,
    61,
    63,
    66,
    68,
    70,
    73,
    75
]
