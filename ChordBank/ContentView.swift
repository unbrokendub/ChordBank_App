//
//  ContentView.swift
//  ChordBank
//
//  Created by Denis Safiullin on 23.09.2023.
//

import AudioToolbox
import SwiftUI

struct ContentView: View {
    @ObservedObject var hostModel: AudioUnitHostModel
    var margin = 10.0
    var doubleMargin: Double {
        margin * 2.0
    }
    
    var body: some View {
        VStack() {
            Text("ChordBank")
                .padding()
                
            VStack(alignment: .center) {
                if let viewController = hostModel.viewModel.viewController {
                    AUViewControllerUI(viewController: viewController)
                        .padding(margin)
                } else {
                    VStack() {
                        Text(hostModel.viewModel.message)
                            .padding()
                    }
                    .frame(minWidth: 400, minHeight: 200)
                }
            }
            .padding(doubleMargin)
            
            if hostModel.viewModel.showAudioControls {
                Text("Audio Playback")
                Button {
                    hostModel.isPlaying ? hostModel.stopPlaying() : hostModel.startPlaying()
                    
                } label: {
                    Text(hostModel.isPlaying ? "Stop" : "Play")
                }
            }
            if hostModel.viewModel.showMIDIContols {
                Text("For use ChordBank you need to open this in AUv3 Host.")
            }
            Spacer()
                .frame(height: margin)
        }
    }
}

#Preview {
    ContentView(hostModel: AudioUnitHostModel())
}
