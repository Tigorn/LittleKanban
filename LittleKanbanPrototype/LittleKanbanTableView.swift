//
//  LittleKanbanTableView.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

class LittleKanbanTableView<T>: UITableView {

    public var listItems: [T]?
    
    public override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        //Hier ist der footer einer einzelnen Kanbanspalte, also muss hier später der "Karte hinzufügen"-Button hin.
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 30.0))
        footerView.backgroundColor = LittleKanbanGray
        let maskPath = UIBezierPath(roundedRect: footerView.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = footerView.bounds
        maskLayer.path = maskPath.cgPath
        footerView.layer.mask = maskLayer
        tableFooterView = footerView
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
