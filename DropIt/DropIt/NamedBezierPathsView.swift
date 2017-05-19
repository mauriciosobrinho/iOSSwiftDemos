//
//  NamedBezierPathsView.swift
//  DropIt
//
//  Created by Mauricio Luiz Sobrinho on 06/04/17.
//  Copyright © 2017 Mauricio Luiz Sobrinho. All rights reserved.
//

import UIKit

class NamedBezierPathsView: UIView {
    
    var bezierPaths = [String: UIBezierPath](){ didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        for(_, path) in bezierPaths{
            path.stroke()
        }
    }

}
