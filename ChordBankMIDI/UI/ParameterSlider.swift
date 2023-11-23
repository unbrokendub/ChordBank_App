//
//  ParameterSlider.swift
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

import SwiftUI
import Controls



/// A SwiftUI Slider container which is bound to an ObservableAUParameter
///
/// This view wraps a SwiftUI Slider, and provides it relevant data from the Parameter, like the minimum and maximum values.
//struct ParameterSlider: View {
//    @ObservedObject var param: ObservableAUParameter
//    
//    var specifier: String {
//        switch param.unit {
//        case .midiNoteNumber:
//            return "%.0f"
//        default:
//            return "%.2f"
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
//        .padding()
//    }
//}

struct ArcSliderSpread: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnob("Spread", value: $param.value, range: 0...70, origin: 0)
        }
        
        .padding(1)
    }
}

struct ArcSliderSize: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnobSize("Size", value: $param.value, range: 1...6, origin: 1)
        }
        .padding(1)
    }
}

struct ArcSliderTranspose: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnob("Transpose", value: $param.value, range: -36...36, origin: 0)
        }
        
        .padding(1)
    }
}

struct ArcSliderOctave: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnob("Octave", value: $param.value, range: -3...3, origin: 0)
        }
        
        .padding(1)
    }
}


struct ArcSliderRandom: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnob("Random", value: $param.value, range: 0...12, origin: 0)
        }
        
        .padding(1)
    }
}

struct ArcSliderVelocity: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankKnob("Velocity", value: $param.value, range: 0...127, origin: 0)
        }
        
        .padding(1)
    }
}

struct ArcSliderChordSet: View {
    @ObservedObject var param: ObservableAUParameter
    
    var specifier: String {
        switch param.unit {
        case .indexed:
            return "%.0f"
        default:
            return "%.2f"
        }
    }
    
    var body: some View {
//        VStack {
//            Slider(
//                value: $param.value,
//                in: param.min...param.max,
//                onEditingChanged: param.onEditingChanged,
//                minimumValueLabel: Text("\(param.min, specifier: specifier)"),
//                maximumValueLabel: Text("\(param.max, specifier: specifier)")
//            ) {
//                EmptyView()
//            }
//            Text("\(param.displayName): \(param.value, specifier: specifier)")
//        }
        
        VStack {
            ChordBankSetKnob("Bank", value: $param.value, range: 0...66, origin: 0)
        }
        
        .padding(1)
    }
}

public struct ChordBankKnob: View {
    @Binding var value: Float
    var text = ""

    var backgroundColor: Color = .gray
    var foregroundColor: Color = .red

    @State var isShowingValue = false
    var range: ClosedRange<Float>
    var origin: Float = 0

    /// Initialize the knob
    /// - Parameters:
    ///   - text: Default text that shows when the value is not shown
    ///   - value: Bound value that is being controlled
    ///   - range: Range of values
    ///   - origin: Center point from which to draw the arc, usually zero but can be 50% for pan
    public init(_ text: String, value: Binding<Float>,
                range: ClosedRange<Float> = 0 ... 100,
                origin: Float = 0) {
        _value = value
        self.origin = origin
        self.text = text
        self.range = range
    }

    func dim(_ proxy: GeometryProxy) -> CGFloat {
        min(proxy.size.width, proxy.size.height)
    }

    let minimumAngle = Angle(degrees: 45)
    let maximumAngle = Angle(degrees: 315)
    var angleRange: CGFloat {
        CGFloat(maximumAngle.degrees - minimumAngle.degrees)
    }

    var nondimValue: Float {
        (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }

    var originLocation: Float {
        (origin - range.lowerBound) / (range.upperBound - range.lowerBound)
    }


    var trimFrom: CGFloat {
        if value >= origin {
            return minimumAngle.degrees / 360 + CGFloat(originLocation) * angleRange / 360.0
        } else {
            return (minimumAngle.degrees + CGFloat(nondimValue) * angleRange) / 360.0
        }
    }

    var trimTo: CGFloat {
        if value >= origin {
            return (minimumAngle.degrees +  CGFloat(nondimValue) * angleRange) / 360.0 + 0.0001
        } else {
            return (minimumAngle.degrees + CGFloat(originLocation) * angleRange) / 360.0
        }
    }

    public var body: some View {
        Control(value: $value, in: range,
                geometry: .twoDimensionalDrag(xSensitivity: 0.6, ySensitivity: 0.6),
                onStarted: { isShowingValue = true },
                onEnded: { isShowingValue = false }) 
        { geo in
            ZStack(alignment: .center) {
                Circle()
                    .trim(from: minimumAngle.degrees / 360.0, to: maximumAngle.degrees / 360.0)

                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0x3A7D44),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                    .foregroundColor(Color(hex: 0xD0DB97))

                // Stroke value trim of knob
                Circle()
                    .trim(from: trimFrom, to: trimTo)
                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0xBBDBB4),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                VStack{
                    Text(text)
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.1, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                    
                    //Text("\(isShowingValue ? "\(Int(value))" : "\(Int(value))" )")
                    Text("\(Int(value))")
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.07, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                }
            }
        }
    }
}



public struct ChordBankKnobSize: View {
    @Binding var value: Float
    var text = ""

    var backgroundColor: Color = .gray
    var foregroundColor: Color = .red

    @State var isShowingValue = false
    var range: ClosedRange<Float>
    var origin: Float = 0

    /// Initialize the knob
    /// - Parameters:
    ///   - text: Default text that shows when the value is not shown
    ///   - value: Bound value that is being controlled
    ///   - range: Range of values
    ///   - origin: Center point from which to draw the arc, usually zero but can be 50% for pan
    public init(_ text: String, value: Binding<Float>,
                range: ClosedRange<Float> = 0 ... 100,
                origin: Float = 0) {
        _value = value
        self.origin = origin
        self.text = text
        self.range = range
    }

    func dim(_ proxy: GeometryProxy) -> CGFloat {
        min(proxy.size.width, proxy.size.height)
    }

    let minimumAngle = Angle(degrees: 45)
    let maximumAngle = Angle(degrees: 315)
    var angleRange: CGFloat {
        CGFloat(maximumAngle.degrees - minimumAngle.degrees)
    }

    var nondimValue: Float {
        (value - range.lowerBound ) / (range.upperBound - range.lowerBound )
    }

    var originLocation: Float {
        (origin  - range.lowerBound  ) / (range.upperBound - range.lowerBound  )
    }


    var trimFrom: CGFloat {
        if value >= origin {
            return minimumAngle.degrees / 360 + CGFloat(originLocation) * angleRange / 360.0
        } else {
            return (minimumAngle.degrees + CGFloat(nondimValue) * angleRange) / 360.0
        }
    }

    var trimTo: CGFloat {
        if value >= origin {
            return (minimumAngle.degrees +  CGFloat(nondimValue) * angleRange) / 360.0 + 0.0001
        } else {
            return (minimumAngle.degrees + CGFloat(originLocation) * angleRange) / 360.0
        }
    }

    public var body: some View {
        Control(value: $value, in: range,
                geometry: .twoDimensionalDrag(xSensitivity: 0.6, ySensitivity: 0.6),
                onStarted: { isShowingValue = true },
                onEnded: { isShowingValue = false })
        { geo in
            ZStack(alignment: .center) {
                Circle()
                    .trim(from: minimumAngle.degrees / 360.0, to: maximumAngle.degrees / 360.0)

                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0x3A7D44),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                    .foregroundColor(Color(hex: 0xD0DB97))

                // Stroke value trim of knob
                Circle()
                    .trim(from: trimFrom, to: trimTo)
                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0xBBDBB4),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                VStack{
                    Text(text)
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.1, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                    
                    //Text("\(isShowingValue ? "\(Int(value))" : "\(Int(value))" )")
                    Text("\(Int(value))")
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.07, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                }
            }
        }
    }
}

public struct ChordBankSetKnob: View {
    @Binding var value: Float
    var text = ""

    var backgroundColor: Color = .gray
    var foregroundColor: Color = .red

    @State var isShowingValue = false
    var range: ClosedRange<Float>
    var origin: Float = 0

    /// Initialize the knob
    /// - Parameters:
    ///   - text: Default text that shows when the value is not shown
    ///   - value: Bound value that is being controlled
    ///   - range: Range of values
    ///   - origin: Center point from which to draw the arc, usually zero but can be 50% for pan
    public init(_ text: String, value: Binding<Float>,
                range: ClosedRange<Float> = 0 ... 100,
                origin: Float = 0) {
        _value = value
        self.origin = origin
        self.text = text
        self.range = range
    }

    func dim(_ proxy: GeometryProxy) -> CGFloat {
        min(proxy.size.width, proxy.size.height)
    }

    let minimumAngle = Angle(degrees: 45)
    let maximumAngle = Angle(degrees: 315)
    var angleRange: CGFloat {
        CGFloat(maximumAngle.degrees - minimumAngle.degrees)
    }

    var nondimValue: Float {
        (value - range.lowerBound  ) / (range.upperBound - range.lowerBound )
    }

    var originLocation: Float {
        (origin - range.lowerBound ) / (range.upperBound - range.lowerBound )
    }


    var trimFrom: CGFloat {
        if value >= origin {
            return minimumAngle.degrees / 360 + CGFloat(originLocation) * angleRange / 360.0
        } else {
            return (minimumAngle.degrees + CGFloat(nondimValue) * angleRange) / 360.0
        }
    }

    var trimTo: CGFloat {
        if value >= origin {
            return (minimumAngle.degrees +  CGFloat(nondimValue) * angleRange) / 360.0 + 0.0001
        } else {
            return (minimumAngle.degrees + CGFloat(originLocation) * angleRange) / 360.0
        }
    }

    public var body: some View {
        let bank: [String] = [
            "Major",                     // 1
            "Minor",                     // 2
            "Harmonic Minor",            // 3
            "Minor Pentatonic",          // 4
            "Major Pentatonic",          // 5
            "Dorian",                    // 6
            "Phrygian",                  // 7
            "Blues",                     // 8
            "Blues Minor",               // 9
            "Blues Minor Maj7",          // 10
            "Blues Heptatonic",          // 11
            "Blues Dorian Hex",          // 12
            "Blues Dorian Hexatonic",    // 13
            "Blues Diminished",          // 14
            "Blues Modified",            // 15
            "Blues Octatonic",           // 16
            "Blues Phrygian",            // 17
            "Chromatic Dorian",          // 18
            "Chromatic Phrygian",        // 19
            "Dominant Bebop",            // 20
            "Jazz Minor Inverse",        // 21
            "Ionian",                    // 22
            "Locrian",                   // 23
            "Lydian",                    // 24
            "Mixolydian",                // 25
            "Ultra Locrian",             // 26
            "Aeolian",                   // 27
            "Algerian",                  // 28
            "Augmented",                 // 29
            "Oriental",                  // 30
            "Enigmatic",                 // 31
            "Enigmatic Minor",           // 32
            "Asian",                     // 33
            "Egyptian",                  // 34
            "Ethiopian",                 // 35
            "Spanish",                   // 36
            "Bhairav",                   // 37
            "Ritsu",                     // 38
            "Puravi bVI",                // 39
            "Nohkan",                    // 40
            "Flamenco",                  // 41
            "Messiaen 2",                // 42
            "Bhairubahar Thaat",         // 43
            "Byzantine Major",           // 44
            "Avaha Raba",                // 45
            "Adonai Malakh",             // 46
            "Zirafkend",                 // 47
            "Melodic Minor",             // 48
            "Utility Minor",             // 49
            "*Leave My Head Alone Brain", // 50
            "*Leave My Black Keys Alone", // 51
            "*Harmonic Pentatonic",       // 52
            "*Strings Of D",              // 53
            "*You Are Sunshine",          // 54
            "*Sakamoto",                  // 55
            "*Pop",                       // 56
            "*Michael",                   // 57
            "*Ligeti",                    // 58
            "*Full Half",                 // 59
            "*Half Full",                 // 60
            "*All Black",                 // 61
            "*Ame Rej",                   // 62
            "*Anime",                     // 63
            "*Back To Me",                // 64
            "*Bugge Wesseltoft",          // 65
            "*Does It Work",              // 66
            "*Frang"                      // 67
        ]
        
        Control(value: $value, in: range,
                geometry: .twoDimensionalDrag(xSensitivity: 0.2, ySensitivity: 0.2),
                onStarted: { isShowingValue = true },
                onEnded: { isShowingValue = false }) { geo in
            ZStack(alignment: .center) {
                Circle()
                    .trim(from: minimumAngle.degrees / 360.0, to: maximumAngle.degrees / 360.0)

                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0x3A7D44),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                    .foregroundColor(Color(hex: 0xD0DB97))

                // Stroke value trim of knob
                Circle()
                    .trim(from: trimFrom, to: trimTo)
                    .rotation(.degrees(-270))
                    .stroke(Color(hex: 0xBBDBB4),
                            style: StrokeStyle(lineWidth: dim(geo) / 30,
                                               lineCap: .round))
                    .squareFrame(dim(geo) * 0.8)
                VStack{
                    Text("Bank")
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.1, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                    Text(bank[Int(value)])
                        .frame(width: dim(geo) * 0.7)
                        .font(Font.system(size: dim(geo) * 0.07, weight: .ultraLight, design: .monospaced))
                        .foregroundColor(Color(hex: 0xD0DB97))
                }
            }
        }
    }
}
