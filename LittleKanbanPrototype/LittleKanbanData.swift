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
         LittleKanbanCellItem(content: "I love programmingI love programmingI love programmingI love programmingI love programmingI love programmingI love programming"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "One more ..."),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),
         LittleKanbanCellItem(content: "Hello World!"),]
        ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I love pI love programmingI love programmingI love programmingI love programmingrogramming"),
         LittleKanbanCellItem(content: "Hello World!")]
        ,
        [LittleKanbanCellItem(content: "Login"),
         LittleKanbanCellItem(content: "I loI love programmingI love programmingI love programmingI love programmingve programming"),
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

