//
//  Midi_InputExtensionParameterAddresses.h
//  Midi_InputExtension
//
//  Created by Denis Safiullin on 23.09.2023.
//

#pragma once

#include <AudioToolbox/AUParameters.h>

#ifdef __cplusplus
namespace Midi_InputExtensionParameterAddress {
#endif

typedef NS_ENUM(AUParameterAddress, Midi_InputExtensionParameterAddress) {
    gain = 0
};

#ifdef __cplusplus
}
#endif
