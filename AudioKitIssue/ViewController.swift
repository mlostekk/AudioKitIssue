//
//  ViewController.swift
//  AudioKitIssue
//
//  Created by Martin Mlostek on 29.08.18.
//  Copyright © 2018 Nomad5. All rights reserved.
//

import UIKit
import AudioKit

class ViewController: UIViewController {

    var sampler: AKAppleSampler? = nil

    @IBAction func onButtonSetup(_ sender: Any) {
        do {
            self.sampler = AKAppleSampler()
            if let url = Bundle.main.url(forResource: "piano", withExtension: "aupreset") {
                let presetPath: String = url.path
                try sampler?.loadPath(presetPath)
                AudioKit.output = sampler
            }

        } catch let error as NSError {
            print(error)
        }
    }

    @IBAction func onStop(_ sender: Any) {
        do {
            try AudioKit.stop()
        } catch let error as NSError {
            print(error)
        }
    }

    @IBAction func onStart(_ sender: Any) {
        do {
            try AudioKit.start()
        } catch let error as NSError {
            print(error)
        }
    }

    @IBAction func onPlay(_ sender: Any) {
        do {
            try sampler?.play(noteNumber: 60, velocity: 100)
        } catch let error as NSError {
            print(error)
        }
    }
}

