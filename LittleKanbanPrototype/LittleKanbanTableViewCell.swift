//
//  LittleKanbanTableViewCell.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

//Das ist die Klasse für die Erstellung einer TableViewCell auf UI-Ebene
public class LittleKanbanTableViewCell: UITableViewCell {

    var bgView: UIView?
    var contentLabel: UILabel
    
    public var item: LittleKanbanCellItem?
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        contentLabel = UILabel(frame: CGRect.zero)
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 15.0)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bgView = UIView(frame: CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0))
        if let bgView = bgView {
            bgView.backgroundColor = UIColor.white
            bgView.layer.masksToBounds = true
            bgView.layer.cornerRadius = 5.0
            addSubview(bgView)
            //bgView.addSubViews(views: contentLabel)
            bgView.addSubview(contentLabel)
        }
        
        selectionStyle = .none
        backgroundColor = LittleKanbanGray
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Diese Methode muss unbedingt überschrieben werden, damit das Layout von der Zelle gesetzt wird, dabei werden auch die Daten gekoppelt. 
    override public func layoutSubviews() {
    super.layoutSubviews()
    
    guard let item = item, let bgView = bgView else  { return }
    //Hier können die einzelnen Zellen verschoben werden.
    bgView.frame = CGRect(x: 10.0, y: 5.0, width: width - 20.0, height: height - 5.0 )
        
        contentLabel.frame = CGRect(x: 15.0, y: 10.0, width: bgView.width + 30.0, height: 20.0)
        contentLabel.text = item.content
    }
}


