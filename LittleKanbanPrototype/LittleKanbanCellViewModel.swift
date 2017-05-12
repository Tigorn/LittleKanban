//
//  LittleKanbanCellViewModel.swift
//  LittleKanbanPrototype
//
//  Created by admin on 10.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

//typealias UpdateCell = ([UIView]) -> [UIView]

public struct LittleKanbanCellViewModel {
    
    public static func updateCell(item: LittleKanbanCellItem, cell: LittleKanbanTableViewCell) -> UITableViewCell {
        cell.contentLabel.text = item.content
        cell.item = item
        return cell
    }
    
    public static func initCell(item: LittleKanbanCellItem, style: UITableViewCellStyle = .default, reuseIdentifier: String) -> UITableViewCell {
        let cell = LittleKanbanTableViewCell(style: style, reuseIdentifier: reuseIdentifier)
        cell.contentLabel.text = item.content
        cell.item = item
        return cell
    }
}
