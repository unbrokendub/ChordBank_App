//
//  ChordBankApp.swift
//  ChordBank
//
//  Created by Denis Safiullin on 23.09.2023.
//

import CoreMIDI
import SwiftUI



@main
struct ChordBankApp: App {
    //@State private var appId = "6470079737"

    
    
    
    
    
    var body: some Scene {
        
        
        WindowGroup {
            
            if Bundle.main.bundlePath.hasSuffix(".auv3"){
                
                @ObservedObject  var hostModel = AudioUnitHostModel()
                ContentView(hostModel: hostModel)
                
            }else{
                Standalone()
            }
        }
    }
}
