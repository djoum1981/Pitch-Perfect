//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Julien Laurent on 11/4/20.
//

import UIKit
import AVFoundation

class RecordVC: UIViewController, AVAudioRecorderDelegate {

    //outlets here
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var recordLbl: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    
    //variables here
    var audioRecorder: AVAudioRecorder!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopBtn.isEnabled = false
        navigationItem.title = "Record"
    }

    @IBAction func recordBtnTapped(_ sender: Any) {
        setButtonStatus(false, true, message: Utility.recordingInprogress)
        
        let recordingPath = [NSSearchPathForDirectoriesInDomains(
                                .documentDirectory, .userDomainMask, true)[0] as String, Utility.recordingName]
        let filePath = URL(string: recordingPath.joined(separator: "/"))
        
        
        let recordingSession = AVAudioSession.sharedInstance()
        try! recordingSession.setCategory(AVAudioSession.Category.playAndRecord,
                                          mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        if let filePath = filePath{
            try! audioRecorder = AVAudioRecorder(url: filePath, settings: [:])
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        }
    }
    
    
    @IBAction func stopBtnTappep(_ sender: UIButton) {
        setButtonStatus(true, false, message: Utility.tapToRecord)
        
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
    }
    
    //to set the status of the buttons
    //and the recording label
    func setButtonStatus(_ enable: Bool, _ disable: Bool, message: String) {
        recordBtn.isEnabled = enable
        stopBtn.isEnabled = disable
        recordLbl.text = message
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag{
            performSegue(withIdentifier: Utility.sequeTransition, sender: audioRecorder.url)
        }else{
            let alert = UIAlertController(title: "Error!", message: Utility.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Utility.sequeTransition{
            let playScreen = segue.destination as! PlayVC
            let recordingUrl = sender as! URL
            playScreen.audioUrlReceive = recordingUrl
            
        }
    }
}

