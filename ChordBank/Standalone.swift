//
//  ChordBankMIDIMainView.swift
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

import SwiftUI


struct Standalone: View {

    
   
    
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
                        .foregroundColor(Color("color3"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.005: g.size.height * 0.005, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                }.background(Color("color5"))
                    .padding(0)
                HStack{
                    Text(" ChordBank")
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color("color3"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.05: g.size.height * 0.05, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                    
                    Text("by unbrokendub ")
                        .scaledToFill()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color("color3"))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.03: g.size.height * 0.03, weight: .ultraLight, design: .monospaced))
                        .padding(3)
                    
                }.background(Color("color5"))
                
                    VStack{
                        Text("For using this plugin")
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.05: g.size.height * 0.05, weight: .ultraLight, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(0)
                        Text("please load ChordBank")
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.05: g.size.height * 0.05, weight: .ultraLight, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(0)
                        Text("in the AUv3 host.")
                            .scaledToFill()
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                            .foregroundColor(.white)
                            .font(Font.system(size: g.size.height > g.size.width ? g.size.width * 0.05: g.size.height * 0.05, weight: .ultraLight, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(0)
                    }
                .background(Color("color4"))
                
                   
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    Image("standalone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .background(Color("color4"))
                


                
                
                
            }
            .background(Color("color4"))
            
        }
        .background(Color("color4"))
    }
}


