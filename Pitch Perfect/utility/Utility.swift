//
//  Utility.swift
//  Pitch Perfect
//
//  Created by Julien Laurent on 11/4/20.
//

import Foundation

//this enum is also provided by udacity
enum ButtonType: Int {
    case slow = 0, fast, highPitch, lowPitch, echo, reverb
}

struct Utility {
    static let sequeTransition = "recordVcSqueTransition"
    static let recordingInprogress = "Recording in progress"
    static let tapToRecord = "Tap the button to record"
    static let recordingName = "voice.wav"
    static let errorMessage = "Unable to record, try again later"
}
