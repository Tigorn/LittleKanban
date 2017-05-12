//
//  LittleKanbanData.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

public struct LittleKanbanData {
    //Hier habe ich das let in var umgeschrieben, damit die Mockdaten mutable werden. Dies vorerst für Testzwecke.
    static var data: [[LittleKanbanCellItem]] = [
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love programming"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "One more ...")]
    ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love programming"),
         LittleKanbanCellItem(content: "Hello World!")]
        ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love programming"),
         LittleKanbanCellItem(content: "Hello World!")]
    ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love programming"),
         LittleKanbanCellItem(content: "Hello World!")]
    ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love programming"),
         LittleKanbanCellItem(content: "Hello World!")]
    ]
}
