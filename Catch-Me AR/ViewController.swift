//
//  GameViewController.swift
//  Catch-Me AR
//
//  Created by Hemang on 31/05/20.
//  Copyright © 2020 Hemang. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        
        // Load the SKScene from 'Scene.sks'
        if let scene = MainMenuScene(fileNamed: "MainMenuScene") {
            sceneView.presentScene(scene)
        }
        
        bannerView.adUnitID = "ca-app-pub-8004873496219777/9718935826"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        bannerView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    


}

extension ViewController: ARSKViewDelegate {
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        
        if GameScene.gameState == .spwanBirds {
            let bird = Bird()
            bird.setup()
            return bird
        }else{
            return SKNode()
        }
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}




extension ViewController: GADBannerViewDelegate{
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Ad Recieved")
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("error")
    }
    
    
}
