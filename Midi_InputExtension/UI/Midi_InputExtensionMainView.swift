//
//  Midi_InputExtensionMainView.swift
//  Midi_InputExtension
//
//  Created by Denis Safiullin on 23.09.2023.
//

import SwiftUI

struct Midi_InputExtensionMainView: View {
    var parameterTree: ObservableAUParameterGroup
    
    var body: some View {
        ParameterSlider(param: parameterTree.global.gain)
    }
}
