//
//  PlaySound.swift
//  SlotMachineGameApp
//
//  Created by Usha Sai Chintha on 23/09/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and load the sound file")
        }
    }
}
