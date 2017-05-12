//
//  LittleKanbanCellItem.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

//Model für die Kanbankarte, die als Zelle eines Tableviews dargestellt wird.
public struct LittleKanbanCellItem {

    public var content: String
    
    public init() {
        self.content = ""
    }
    
    public init(content: String) {
        self.content = content
    }
}
