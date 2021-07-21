//
//  SceneManager.swift
//  Weather_SwiftUI
//
//  Created by 임현지 on 2021/07/20.
//

import UIKit
import SceneKit

class SceneManager {
    var scene = SCNScene(named: "prototype.obj")
    lazy var sceneNode: SCNNode? = (scene?.rootNode.childNode(withName: "prototype.obj", recursively: false))
    
    init() {
        animateNode()
    }
    
//    func animateNode() {
//        scene.rootNode.enumerateHierarchy { child, _ in
//            for key in child.animationKeys {
//                let animation = child.animationPlayer(forKey: key)?.animation
//                animation?.repeatCount = CGFloat(HUGE)
//                animation?.isRemovedOnCompletion = false
//                sceneNode.addAnimation(animation!, forKey: key)
//            }
//        }
//    }
    
    func animateNode() {
        let animation = CABasicAnimation(keyPath: "geometry.extrusionDepth")
        animation.fromValue = 0.0
        animation.toValue = 100.0
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        sceneNode!.addAnimation(animation, forKey: "extrude")
    }
}
