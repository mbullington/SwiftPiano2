//
//  PianoAudio.c
//  SwiftPiano
//
//  Created by Michael Bullington on 6/10/14.
//  Copyright (c) 2014 Michael Bullington. All rights reserved.
//

#include <stdio.h>
#include <CoreMIDI/CoreMIDI.h>
#include <mach/mach_time.h>
#include "PianoAudio.h"

MIDIClientRef client;
MIDIEndpointRef endpoint;

void PianoAudioInit() {
    int status = MIDIClientCreate(CFSTR("SwiftPiano"), NULL, NULL, &client);
    printf("Creation of a MIDI client %s!\n", status == noErr ? "succeeded" : "failed");
    
    status = MIDISourceCreate(client, CFSTR("SwiftPiano"), &endpoint);
    printf("Creation of a MIDI source %s!\n", status == noErr ? "succeeded" : "failed");
}

void PianoAudioPlayNote(int note) {
    Byte buffer[32];
    MIDIPacketList *packetList = (MIDIPacketList*) buffer;
    MIDIPacket *packet = MIDIPacketListInit(packetList);
    
    Byte noteBytes[3] = {0x90, note, 100};
    packet = MIDIPacketListAdd(packetList, sizeof(buffer), packet, mach_absolute_time(), 3, noteBytes);
    MIDIReceived(endpoint, packetList);
}

void PianoAudioStopNote(int note) {
    Byte buffer[32];
    MIDIPacketList *packetList = (MIDIPacketList*) buffer;
    MIDIPacket *packet = MIDIPacketListInit(packetList);
    
    Byte noteBytes[3] = {0x80, note, 100};
    packet = MIDIPacketListAdd(packetList, sizeof(buffer), packet, mach_absolute_time(), 3, noteBytes);
    MIDIReceived(endpoint, packetList);
}