//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Properties
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func keyTapped(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle ?? "")
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
    }
    
    //MARK: - Method Functions
    func playSound(soundName: String) {
        
        guard  let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}//END OF CLASS

