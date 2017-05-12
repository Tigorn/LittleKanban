//
//  LittleKanbanPrototypeListView.swift
//  LittleKanbanPrototype
//
//  Created by admin on 09.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

class LittleKanbanPrototypeListView: UIScrollView {

    //Anzahl der Container für die TableViews, die unsere Kanbanspalten repräsentieren. Diese brauchen wir für die Berechnung der Breite der horizontalen ScrollView.
    public var littleKanbanColumnCount: Int
    
    //Die horizontale ScrollView wird initialisiert und zusammengebaut
    public init(frame: CGRect, index: Int = 0, littleKanbanColumnCount: Int) {
        self.littleKanbanColumnCount = littleKanbanColumnCount
        super.init(frame: frame)
        //Die horizontale ScrollView kann seitenweise gescrollt werden.
        isPagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        //Berechnung der Breite der horizontalen ScrollView im Parameter width. Die Variablen SreenWidth und height kommen als Konstanten von der LittleKanbanPrototypeConstants:
        contentSize = CGSize(width: CGFloat(littleKanbanColumnCount) * (ScreenWidth-45.0), height: height)
        //Wo soll die horizontale ScrollView positioniert werden?
        contentOffset = CGPoint(x: 0, y: 0)
    }
    
    //Diese Methode muss auch noch implementiert werden, weil es das Protokoll verlangt. 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
