//
//  DropItViewController.swift
//  DropIt
//
//  Created by Mauricio Luiz Sobrinho on 06/04/17.
//  Copyright © 2017 Mauricio Luiz Sobrinho. All rights reserved.
//

import UIKit

class DropItViewController: UIViewController {

   
    @IBOutlet weak var gameView: DropItView!{
        didSet{
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addDrop(recognizer:))))
            gameView.addGestureRecognizer(UIPanGestureRecognizer(target: gameView, action: #selector(DropItView.grabDrop(recognizer:))))
        }
    }
    
    func addDrop(recognizer: UITapGestureRecognizer){
        if recognizer.state == .ended{
            gameView.addDrop()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        gameView.animating = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.animating = false
    }
}
