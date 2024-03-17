//
//  PlayerView.swift
//  RebeccaBiaz
//
//  Created by Rebecca Biaz on 17/03/2024.
//

import UIKit
import AVKit

final class PlayerView : UIView {
    var videoURL: URL?
    var queuePlayer: AVQueuePlayer?
    var playerLayer: AVPlayerLayer?
    var playbackLooper: AVPlayerLooper?
    
    func prepareVideo(_ videoURL: URL) {
        
        let playerItem = AVPlayerItem(url: videoURL)
        
        self.queuePlayer = AVQueuePlayer(playerItem: playerItem)
        self.playerLayer = AVPlayerLayer(player: self.queuePlayer)
        guard let playerLayer = self.playerLayer else {return}
        guard let queuePlayer = self.queuePlayer else {return}
        self.playbackLooper = AVPlayerLooper.init(player: queuePlayer, templateItem: playerItem)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = self.frame
        self.layer.addSublayer(playerLayer)
    }
    
    
    func play() {
         self.queuePlayer?.play()
     }
     
     
    func pause() {
         self.queuePlayer?.pause()
     }
     
     
    func stop() {
        self.queuePlayer?.pause()
        self.queuePlayer?.seek(to: CMTime.init(seconds: 0, preferredTimescale: 1))
    }
    
    func unload() {
        self.playerLayer?.removeFromSuperlayer()
        self.playerLayer = nil
        self.queuePlayer = nil
        self.playbackLooper = nil
    }
}
