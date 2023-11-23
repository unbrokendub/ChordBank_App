//
//  ChordBankMIDIParameterAddresses.h
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

#pragma once

#include <AudioToolbox/AUParameters.h>

#ifdef __cplusplus
namespace ChordBankMIDIParameterAddress {
#endif

typedef NS_ENUM(AUParameterAddress, ChordBankMIDIParameterAddress) {
  //  sendNote = 0,
   // midiNoteNumber = 1,
    chordSpread = 2,
    chordTranspose = 3,
    chordBank = 4,
    chordOctave = 5,
    chordSize = 6,
    chordRandom = 7,
    chordVelocity = 1
};

#ifdef __cplusplus
}
#endif
