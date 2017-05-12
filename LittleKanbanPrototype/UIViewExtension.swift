//
//  UIViewExtension.swift
//  LittleKanbanPrototype
//
//  Created by admin on 09.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

extension UIView {
    
    //Die addSubView-Methode wird um die Fähigkeit erweitert mehrere Views aufnehmen zu können.
    public func addSubViews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    public func addSubViews(views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            let newSize = CGSize(width: frame.width, height: newValue)
            frame = CGRect(origin: frame.origin, size: newSize)
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            let newSize = CGSize(width: newValue, height: frame.height)
            frame = CGRect(origin: frame.origin, size: newSize)
        }
    }
}
