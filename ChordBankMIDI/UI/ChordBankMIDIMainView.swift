//
//  ChordBankMIDIMainView.swift
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

import SwiftUI
import Controls

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct ChordBankMIDIMainView: View {
    var parameterTree: ObservableAUParameterGroup
    

   // @State var value : Int = 0
    //@State var index2 = 0
    
    var body: some View {
        GeometryReader{g in
            VStack(alignment: .leading) {
                HStack{
                    Text("  ")
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color(hex: 0xD0DB97))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.005: g.size.height * 0.005, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                }.background(Color(hex: 0x254D32))
                    .padding(0)
                HStack{
                    Text(" ChordBank")
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color(hex: 0xD0DB97))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.05: g.size.height * 0.05, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                    
                    Text("by unbrokendub ")
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color(hex: 0xD0DB97))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.03: g.size.height * 0.03, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                    
                }
                .background(Color(hex: 0x254D32))
                
                
                ZStack{
                    
                    VStack{
                        
                        Spacer()
                            .frame(height: g.size.height / 8 )
                        HStack{
                            Spacer()
                                .frame(width: g.size.width / 4 )
                            ArcSliderChordSet(param: parameterTree.global.chordBank)
                                .padding(10)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordBank.value = 0
                                }
                            Spacer()
                                .frame(width: g.size.width / 4 )
                        }
                        Spacer()
                            .frame(height: g.size.height / 8 )
                        
                    }
                    
                    VStack{
                        HStack {
                            
                            
                            ArcSliderOctave(param: parameterTree.global.chordOctave)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordOctave.value = 0
                                }
                              
                            Spacer()
                                .frame(width: g.size.width / 3 )
                           
                            ArcSliderSize(param: parameterTree.global.chordSize)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordSize.value = 3
                                }
                               
                            
                        }
                        
                        
                        HStack{
                            ArcSliderSpread(param: parameterTree.global.chordSpread)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordSpread.value = 0
                                }
                            Spacer()
                                .frame(width: g.size.width / 3 )
                            ArcSliderTranspose(param: parameterTree.global.chordTranspose)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordTranspose.value = 0
                                }
                            
                        }
                        
                        HStack{
                            ArcSliderRandom(param: parameterTree.global.chordRandom)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordRandom.value = 0
                                }
                            
                            Spacer()
                                .frame(width: g.size.width / 3 )
                            
                            ArcSliderVelocity(param: parameterTree.global.chordVelocity)
                                .onTapGesture (count: 2){
                                    parameterTree.global.chordVelocity.value = 127
                                }
                                
                        }
                    }
                }

                
                
                
            }
            .background(Color(hex: 0x181D27))
        }
    }
}


