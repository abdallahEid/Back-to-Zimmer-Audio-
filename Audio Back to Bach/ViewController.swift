//
//  ViewController.swift
//  Audio Back to Bach
//
//  Created by Abdallah Eid on 10/26/17.
//  Copyright © 2017 TripleApps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    var timer = Timer()
    
    let audioPath = Bundle.main.path(forResource: "LostWon", ofType: "mp3")
    
    func updateSeeker () {
        
        seeker.value = Float(player.currentTime)
        
    }
    
    @IBAction func play(_ sender: Any) {
        
        player.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateSeeker), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pause(_ sender: Any) {
        
        player.pause()
        
        timer.invalidate()
        
    }
    
    @IBOutlet var volumeText: UISlider!
    
    @IBAction func volume(_ sender: Any) {
        
        player.volume = volumeText.value
        
    }

    @IBOutlet var seeker: UISlider!
    
    @IBAction func seekerMoved(_ sender: Any) {
        
        player.currentTime = TimeInterval(seeker.value)
        
        //print (volumeText.value)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            seeker.maximumValue = Float(player.duration)
            
            print(player.duration)
            
        
        }catch {
            
            // errors
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

