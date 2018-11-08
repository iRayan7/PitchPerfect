//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Rayan Aldafas on 07/11/2018.
//  Copyright © 2018 RayanAldafas. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recorderAudioURL: URL!
    
    
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!

    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // to not play the sound until its asked to do so
        setupAudio()

        
        // set the imageView content mode for images to scaleToFit
        setButtonsScaling()

    }
    
    func setButtonImageViewToscaleAspectFit(button: UIButton) {
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
    }
    
    func setButtonsScaling() {
        setButtonImageViewToscaleAspectFit(button: chipmunkButton)
        setButtonImageViewToscaleAspectFit(button: rabbitButton)
        setButtonImageViewToscaleAspectFit(button: snailButton)
        setButtonImageViewToscaleAspectFit(button: vaderButton)
        setButtonImageViewToscaleAspectFit(button: echoButton)
        setButtonImageViewToscaleAspectFit(button: reverbButton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // to manage the state of buttons
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton( _ sender: UIButton){
//        print("sound played!")
        
        // switch statement to play the sounds
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        // change the state of buttons
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed( _ sender: UIButton){
        // stop the audio
        stopAudio()
    }
    



}
