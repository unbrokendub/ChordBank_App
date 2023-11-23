//
//  Midi_InputExtensionAudioUnit.h
//  Midi_InputExtension
//
//  Created by Denis Safiullin on 23.09.2023.
//

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface Midi_InputExtensionAudioUnit : AUAudioUnit
- (void)setupParameterTree:(AUParameterTree *)parameterTree;
@end
