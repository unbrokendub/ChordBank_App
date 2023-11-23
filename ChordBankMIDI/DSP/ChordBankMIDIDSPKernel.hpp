//
//  ChordBankMIDIDSPKernel.hpp
//  ChordBankMIDI
//
//  Created by Denis Safiullin on 23.09.2023.
//

#pragma once

#import <AudioToolbox/AudioToolbox.h>
#import <algorithm>
#import <vector>

//#import "ChordBankMIDI-Swift.h"
#import "ChordBankMIDIParameterAddresses.h"
#import "ChordBank.h"


#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define randnum(min, max) \
((rand() % (int)(((max) + 1) - (min))) + (min))

#define randnuminvert(max, min) \
((rand() % (int)(((max) + 1) - (min))) + (min))

constexpr uint16_t kMaxVelocity = std::numeric_limits<std::uint16_t>::max();

/*
 ChordBankMIDIDSPKernel
 As a non-ObjC class, this is safe to use from render thread.
 */
class ChordBankMIDIDSPKernel {
public:
    void initialize(double inSampleRate) {
        mSampleRate = inSampleRate;
    }
    
    void deInitialize() {
    }
    
    // MARK: - Bypass
    bool isBypassed() {
        return mBypassed;
    }
    
    void setBypass(bool shouldBypass) {
        mBypassed = shouldBypass;
    }
    
    // MARK: - Parameter Getter / Setter
    // Add a case for each parameter in ChordBankMIDIParameterAddresses.h
    void setParameter(AUParameterAddress address, AUValue value) {
        switch (address) {
            case ChordBankMIDIParameterAddress::chordSpread:
                currentChordSpread = (int)value;
               // printf("From setParameter. Spread = %d",currentChordSpread);
                break;
            case ChordBankMIDIParameterAddress::chordTranspose:
                currentChordTranspose = (int)value;
              //  printf("From setParameter. Transpose = %d",currentChordTranspose);
                break;
            case ChordBankMIDIParameterAddress::chordSize:
                currentChordSize = (int)value;
               // printf("From setParameter. Size = %d",currentChordSize);
                break;
            case ChordBankMIDIParameterAddress::chordOctave:
                currentChordOctave = (int)value;
               // printf("From setParameter. Octave = %d",currentChordOctave);
                break;
            case ChordBankMIDIParameterAddress::chordBank:
                currentChordBank = (int)value;
               // printf("From setParameter. Bank = %d",currentChordBank);
                break;
            case ChordBankMIDIParameterAddress::chordRandom:
                currentChordRandom = (int)value;
               // printf("From setParameter. Bank = %d",currentChordBank);
                break;
            case ChordBankMIDIParameterAddress::chordVelocity:
                currentChordVelocity = (int)value;
             //   printf("From setParameter. velocity = %d",currentChordVelocity);
                break;
        }
    }
    
    AUValue getParameter(AUParameterAddress address) {
        // Return the goal. It is not thread safe to return the ramping value.
        
        switch (address) {

            case ChordBankMIDIParameterAddress::chordSpread:
                return (AUValue)currentChordSpread;
                
            case ChordBankMIDIParameterAddress::chordTranspose:
                return (AUValue)currentChordTranspose;
                
            case ChordBankMIDIParameterAddress::chordSize:
                return (AUValue)currentChordSize;
                
            case ChordBankMIDIParameterAddress::chordOctave:
                return (AUValue)currentChordOctave;
                
            case ChordBankMIDIParameterAddress::chordBank:
                return (AUValue)currentChordBank;
                
            case ChordBankMIDIParameterAddress::chordRandom:
                return (AUValue)currentChordRandom;
                
            case ChordBankMIDIParameterAddress::chordVelocity:
                return (AUValue)currentChordVelocity;
                
            default: return 0.f;
        }
    }
    
    // MARK: - Maximum Frames To Render
    AUAudioFrameCount maximumFramesToRender() const {
        return mMaxFramesToRender;
    }
    
    void setMaximumFramesToRender(const AUAudioFrameCount &maxFrames) {
        mMaxFramesToRender = maxFrames;
    }
    
    // MARK: - Musical Context
    void setMusicalContextBlock(AUHostMusicalContextBlock contextBlock) {
        mMusicalContextBlock = contextBlock;
    }
    
    // MARK: - MIDI Output
    void setMIDIOutputEventBlock(AUMIDIEventListBlock midiOutBlock) {
        mMIDIOutBlock = midiOutBlock;
    }
    
    // MARK: - MIDI Protocol
    MIDIProtocolID AudioUnitMIDIProtocol() const {
        return kMIDIProtocol_2_0;
    }
    
    /**
     MARK: - Internal Process
     
     This function does the core siginal processing.
     Do your custom MIDI processing here.
     */
    void process(AUEventSampleTime bufferStartTime, AUAudioFrameCount frameCount) {
        
        //printf("bufferstarttime = %lld", bufferStartTime);
       // printf("\n");
        
        currentbuffertime = bufferStartTime;
        if (mBypassed) { return; }
        
        // Use this to get Musical context info from the Plugin Host,
        // Replace nullptr with &memberVariable according to the AUHostMusicalContextBlock function signature
        if (mMusicalContextBlock) {
            mMusicalContextBlock(nullptr /* currentTempo */,
                                 nullptr /* timeSignatureNumerator */,
                                 nullptr /* timeSignatureDenominator */,
                                 nullptr /* currentBeatPosition */,
                                 nullptr /* sampleOffsetToNextBeat */,
                                 nullptr /* currentMeasureDownbeatPosition */);
        }
        
        /*
         // If you require sample-accurate sequencing, calculate your midi events based on the frame and buffer offsets
         
         for (int frameIndex = 0; frameIndex < frameCount; ++frameIndex) {
         const int frameOffset = int(frameIndex + frameOffset);
         // Do sample-accurate sequencing here
         }
         */
        
        // Do your midi processing here
        
        if (mShouldSendNoteOn && !mNoteIsCurrentlyOn) {
            // note was not on, but should be - send a new note-on
            sendNoteOn(bufferStartTime, mNextNoteToSend, kMaxVelocity);
            sendNoteOn(bufferStartTime, mNextNoteToSend + 2, kMaxVelocity);
            sendNoteOn(bufferStartTime, mNextNoteToSend + 5, kMaxVelocity);
            mLastSentNote = mNextNoteToSend;
            mNoteIsCurrentlyOn = true;
            
        } else if (mShouldSendNoteOn && mNoteIsCurrentlyOn && mLastSentNote != mNextNoteToSend) {
            // note was on, but the note number changed - send a note off for the old note, and send a note-on for the new one
            sendNoteOff(bufferStartTime, mLastSentNote, 0);
            sendNoteOff(bufferStartTime, mLastSentNote + 2, 0);
            sendNoteOff(bufferStartTime, mLastSentNote + 5, 0);
            sendNoteOn(bufferStartTime, mNextNoteToSend, kMaxVelocity);
            mLastSentNote = mNextNoteToSend;
            
        } else if (!mShouldSendNoteOn && mNoteIsCurrentlyOn) {
            // note was on but should turn off
            sendNoteOff(bufferStartTime, mLastSentNote, 0);
            sendNoteOff(bufferStartTime, mLastSentNote + 2, 0);
            sendNoteOff(bufferStartTime, mLastSentNote + 5, 0);
            mNoteIsCurrentlyOn = false;
        }
        
    }
    
    void sendNoteOn(AUEventSampleTime sampleTime, uint8_t noteNum, uint16_t velocity) {
        auto message = MIDI2NoteOn(0, 0, noteNum, 0, 0, velocity);
       // printf("\n From noteOn. velocity = %d",velocity);
        MIDIEventList eventList = {};
        MIDIEventPacket *packet = MIDIEventListInit(&eventList, kMIDIProtocol_2_0);
        packet = MIDIEventListAdd(&eventList, sizeof(MIDIEventList), packet, 0, 2, (UInt32 *)&message);
        mMIDIOutBlock(sampleTime, 0, &eventList);
    }
    
    void sendNoteOff(AUEventSampleTime sampleTime, uint8_t noteNum, uint16_t velocity) {
        auto message = MIDI2NoteOff(0, 0, noteNum, 0, 0, velocity);
        MIDIEventList eventList = {};
        MIDIEventPacket *packet = MIDIEventListInit(&eventList, kMIDIProtocol_2_0);
        packet = MIDIEventListAdd(&eventList, sizeof(MIDIEventList), packet, 0, 2, (UInt32 *)&message);
        mMIDIOutBlock(sampleTime, 0, &eventList);
    }
    
    void handleOneEvent(AUEventSampleTime now, AURenderEvent const *event) {
        switch (event->head.eventType) {
            case AURenderEventParameter: {
                handleParameterEvent(now, event->parameter);
                break;
            }
                
            case AURenderEventMIDIEventList: {
                handleMIDIEventList(now, &event->MIDIEventsList);
                break;
            }
                
            default:
                break;
        }
    }

    void handleMIDI2VoiceMessage(const struct MIDIUniversalMessage& message) {
//        for (int delay = 0; delay < 1000000; delay++){
//           
//       }
       
        
       // setParameter(ChordBankMIDIParameterAddress::chordSpread, currentChordSpread)
        
        currentChordSpread =  getParameter(ChordBankMIDIParameterAddress::chordSpread);
        currentChordBank = getParameter(ChordBankMIDIParameterAddress::chordBank);
        currentChordOctave = getParameter(ChordBankMIDIParameterAddress::chordOctave);
        currentChordSize = getParameter(ChordBankMIDIParameterAddress::chordSize);
        currentChordVelocity = getParameter(ChordBankMIDIParameterAddress::chordVelocity);
        int chordspread = currentChordSpread;
        int chordbank = currentChordBank;
        
     //   printf("chordSpread = %d",chordspread);
        const auto& note = message.channelVoice2.note;
        
        switch (message.channelVoice2.status) {
            case kMIDICVStatusNoteOff: {
                //printf("ChordBankMIDI Midi off recieved \n");
                for (uint8_t i = 0; i < sizeMemory[note.number]; i++){
                 
                    if (chordMemory[note.number][i] != 0){
                        sendNoteOff(currentbuffertime + 2, chordMemory[note.number][i],0);
                    }
                        
                   
                }
            }
                break;
                
            case kMIDICVStatusNoteOn: {
                
//                printf("ChordBankMIDI recieved note.number %d", note.number );
//                printf("\n");
                
                
             //   int chordNotes = randnum(0, 10);
                
                for (int i = 0; i < currentChordSize ; i++){
                 
                    
                    
                    sizeMemory[note.number] = currentChordSize;
                    int8_t chordNote = Chords[chordbank][note.number][i] + currentChordTranspose + spread[chordspread][i] + (currentChordOctave * 12) + randomfactor[randnum(0, currentChordRandom)];
                    
                    if (chordNote < 0){
                        chordNote = 0;
                    } else if (chordNote > 127){
                        chordNote = 127;
                    }
                    
                    chordMemory[note.number][i] = chordNote;
                    uint16_t vvelocity = currentChordVelocity * 516;
                    
                    if (chordNote != 0){
                       // sendNoteOn(currentbuffertime + 2, chordNote, message.channelVoice2.note.velocity);
                        
                        if (vvelocity < message.channelVoice2.note.velocity){
                            sendNoteOn(currentbuffertime + 2, chordNote, uint16_t(randnum(vvelocity, message.channelVoice2.note.velocity)));
                        } else {
                            sendNoteOn(currentbuffertime + 2, chordNote, uint16_t(randnuminvert(vvelocity, message.channelVoice2.note.velocity)));
                        }
                        
                        
                       // printf("\n current velocity %d", message.channelVoice2.note.velocity);
                       // sendNoteOn(currentbuffertime + 2, chordNote, vvelocity);
                    }
                    
                    
                    //int chspr = currentChordSpread;
             
                }
                
                
               // sendNoteOn(5, note.number,message.channelVoice2.note.velocity);
               // sendNoteOn(5, note.number + 2,message.channelVoice2.note.velocity);
               // sendNoteOn(5, note.number + 5,message.channelVoice2.note.velocity);
               // sendNoteOn(5, note.number + 12,message.channelVoice2.note.velocity);
                
               
            }
                break;
                
            default:
                break;
        }
    }
    
    void handleMIDIEventList(AUEventSampleTime now, AUMIDIEventList const* midiEvent) {
        auto visitor = [] (void* context, MIDITimeStamp timeStamp, MIDIUniversalMessage message) {
            auto thisObject = static_cast<ChordBankMIDIDSPKernel *>(context);
            
            switch (message.type) {
                case kMIDIMessageTypeChannelVoice2: {
                    thisObject->handleMIDI2VoiceMessage(message);
                }
                    break;
                    
                default:
                    break;
            }
        };
        
        MIDIEventListForEachEvent(&midiEvent->eventList, visitor, this);
    }
    
    void handleParameterEvent(AUEventSampleTime now, AUParameterEvent const& parameterEvent) {
        // Implement handling incoming Parameter events as needed
        switch (parameterEvent.parameterAddress) {

            case ChordBankMIDIParameterAddress::chordSpread:
                currentChordSpread = (int)parameterEvent.value;
            break;
            case ChordBankMIDIParameterAddress::chordTranspose:
                currentChordTranspose = (int)parameterEvent.value;
                break;
            case ChordBankMIDIParameterAddress::chordSize:
                currentChordSize = (int)parameterEvent.value;
                break;
            case ChordBankMIDIParameterAddress::chordOctave:
                currentChordOctave = (int)parameterEvent.value;
                break;
            case ChordBankMIDIParameterAddress::chordBank:
                currentChordBank = (int)parameterEvent.value;
                break;
            case ChordBankMIDIParameterAddress::chordRandom:
                currentChordRandom = (int)parameterEvent.value;
                break;
                
            case ChordBankMIDIParameterAddress::chordVelocity:
                currentChordVelocity = (int)parameterEvent.value;
                break;
        }
        
    }
    
    // MARK: Member Variables
    AUHostMusicalContextBlock mMusicalContextBlock;
    
    double mSampleRate = 44100.0;
    bool mBypassed = false;
    AUAudioFrameCount mMaxFramesToRender = 1024;
    
    bool mShouldSendNoteOn = false;  //  Should we send a note-on next process?
    bool mNoteIsCurrentlyOn = false;  //  Have we sent a note-on without a matching note off?
    uint8_t mLastSentNote = 255;
    uint8_t mNextNoteToSend = 255;
    int currentChordSpread = 0;
    int currentChordTranspose = 0;
    int currentChordOctave = 0;
    int sendedChordSpread = 0;
    int currentChordBank = 0;
    int currentChordRandom = 0;
    int currentChordSize = 0;
    int currentChordVelocity = 127;
    long currentbuffertime = 0;
   
    AUMIDIEventListBlock mMIDIOutBlock;
    
    
};
