//
//  PlayVCViewController.swift
//  Pitch Perfect
//
//  Created by Julien Laurent on 11/4/20.
//

import UIKit

class PlayVC: UIViewController {
    
    var audioUrlReceive: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let audioUrlReceive = audioUrlReceive{
            print(audioUrlReceive)
        }
    }
    

    

}
