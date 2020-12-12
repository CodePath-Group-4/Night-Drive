//
//  MusicViewController.swift
//  Night Drive
//
//  Created by Rashon Poole on 12/6/20.
//

import UIKit
import AVFoundation
class MusicViewController: UIViewController {

    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func playButton(_ sender: Any) {
        if let player = player, player.isPlaying{
            player.stop()
        }
        else{
            
            let urlString = Bundle.main.path(forResource: "Childish Gambino - Sober", ofType: "mp3")
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else{
                    return
                }
                
                player.play()
            }
            catch{
                print("a problem occured")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
