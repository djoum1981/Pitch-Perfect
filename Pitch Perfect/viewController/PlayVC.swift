//
//  PlayVCViewController.swift
//  Pitch Perfect
//
//  Created by Julien Laurent on 11/4/20.
//

import UIKit
import AVFoundation


class PlayVC: UIViewController {
   
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //the following variable
    //where provided by Udacity to be used with
    //the playback extension class
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    
    var audioUrlReceive: URL!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Play audio"

       setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButtonPressed(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag){
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        default:
            print("Unrecognize sound")
    }
        configureUI(.playing)
}

    @ IBAction func stopButtonPressed(_ sender: UIButton) {
        stopAudio()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAudio()
    }
}
