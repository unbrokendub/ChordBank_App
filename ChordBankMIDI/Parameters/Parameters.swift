//
//  Parameters.swift
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

import Foundation
import AudioToolbox

let ChordBankMIDIParameterSpecs = ParameterTreeSpec {
    ParameterGroupSpec(identifier: "global", name: "Global") {
//        ParameterSpec(
//            address: .sendNote,
//            identifier: "sendNote",
//            name: "Send Note",
//            units: .boolean,
//            valueRange: 0...1,
//            defaultValue: 0
//        )
//        
//        ParameterSpec(
//            address: .midiNoteNumber,
//            identifier: "midiNoteNumber",
//            name: "MIDI Note Number",
//            units: .midiNoteNumber,
//            valueRange: 0...127,
//            defaultValue: 60,
//            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
//        )
        
        ParameterSpec(
            address: .chordSpread,
            identifier: "chordSpread",
            name: "Spread",
            units: .indexed,
            valueRange: 0...71,
            defaultValue: 0,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordTranspose,
            identifier: "chordTranspose",
            name: "Transpose",
            units: .degrees,
            valueRange: -36...36,
            defaultValue: 0,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordOctave,
            identifier: "chordOctave",
            name: "Octave",
            units: .degrees,
            valueRange: -3...3,
            defaultValue: 0,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordBank,
            identifier: "chordBank",
            name: "Bank",
            units: .indexed,
            valueRange: 0...66,
            defaultValue: 0,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordSize,
            identifier: "chordSize",
            name: "Size",
            units: .indexed,
            valueRange: 1...6,
            defaultValue: 3,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordRandom,
            identifier: "chordRandom",
            name: "Random",
            units: .indexed,
            valueRange: 0...12,
            defaultValue: 0,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
        
        ParameterSpec(
            address: .chordVelocity,
            identifier: "chordVelocity",
            name: "Velocity",
            units: .indexed,
            valueRange: 0...127,
            defaultValue: 127,
            flags: [.flag_IsWritable] // so that hosts like AUM expose this as automatable
        )
    }
}

extension ParameterSpec {
    init(
        address: ChordBankMIDIParameterAddress,
        identifier: String,
        name: String,
        units: AudioUnitParameterUnit,
        valueRange: ClosedRange<AUValue>,
        defaultValue: AUValue,
        unitName: String? = nil,
        flags: AudioUnitParameterOptions = [AudioUnitParameterOptions.flag_IsWritable, AudioUnitParameterOptions.flag_IsReadable],
        valueStrings: [String]? = nil,
        dependentParameters: [NSNumber]? = nil
    ) {
        self.init(address: address.rawValue,
                  identifier: identifier,
                  name: name,
                  units: units,
                  valueRange: valueRange,
                  defaultValue: defaultValue,
                  unitName: unitName,
                  flags: flags,
                  valueStrings: valueStrings,
                  dependentParameters: dependentParameters)
    }
}
