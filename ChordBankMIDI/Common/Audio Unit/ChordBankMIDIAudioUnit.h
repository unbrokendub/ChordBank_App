//
//  ChordBankMIDIAudioUnit.h
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ChordBankMIDIAudioUnit : AUAudioUnit
- (void)setupParameterTree:(AUParameterTree *)parameterTree;
@end
