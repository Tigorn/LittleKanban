//
//  LittleKanbanSectionView.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

class LittleKanbanSectionView: UIView {

    private var titleLabel: UILabel
    
    public var title: String = " " {
        didSet {
            titleLabel.text = title
        }
    }
    
    
    override public init(frame: CGRect) {
        titleLabel = UILabel(frame: CGRect(x: 30.0, y: 20.0, width: frame.size.width - 60.0, height: 20.0))
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        super.init(frame: frame)
        backgroundColor = LittleKanbanGray
        let bottomLine = UIView(frame: CGRect(x: 0, y: height - 1.0, width: width, height: 1.0))
        bottomLine.backgroundColor = LittleKanbanLightGray
        addSubViews(views: titleLabel, bottomLine)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
