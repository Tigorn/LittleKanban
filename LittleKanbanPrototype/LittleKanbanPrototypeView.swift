//
//  LittleKanbanPrototypeView.swift
//  LittleKanbanPrototype
//
//  Created by admin on 09.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

class LittleKanbanPrototypeView: UIView, UIScrollViewDelegate {

    //Die horizontale UIScrollView wird zum Zusammenbau in dieser Klasse bekannt gemacht.
    public var littleKanbanScrollView : LittleKanbanPrototypeListView
    //Die Anzahl der Kanbanspalten wird hier gespeichert und dem Konstruktur des horizontalen ScrollViews zu übergeben.
    public var littleKanbanColumnCount: Int
    
    weak public var delegate: UITableViewDelegate? {
        didSet {
            _ = littleKanbanColumnsAsTableViews.map { tableView in
                tableView.delegate = delegate
            }
        }
    }
    weak public var dataSource: UITableViewDataSource? {
        didSet {
            _ = littleKanbanColumnsAsTableViews.map { tableView in
                tableView.dataSource = dataSource
            }
        }
    }
    
    //Dieses Array speichert die TableViews (unsere Kanbanspalten), die auf der horizontalen ScrollView angezeigt werden.
    public var littleKanbanColumnsAsTableViews: [UITableView] = []
    
    public init(frame: CGRect, littleKanbanColumnCount: Int) {
    
        self.littleKanbanColumnCount = littleKanbanColumnCount
        
        littleKanbanScrollView = LittleKanbanPrototypeListView(frame: CGRect(x: 0.0, y: 0.0, width: ScreenWidth - 45.0, height: frame.height), littleKanbanColumnCount: littleKanbanColumnCount)
        
        
        //Elternklasse muss initialisiert werden, deswegen super-Aufruf obligatorisch
        super.init(frame: frame)
        
        //Das delegate des horizontalen Scrollview wird mit der UIView gekoppelt.
        littleKanbanScrollView.delegate = self
        
        self.addSubViews(views: littleKanbanScrollView)
        
        for i in 0..<littleKanbanColumnCount {
            let x: CGFloat = CGFloat(i) * (ScreenWidth - 60.0 + 15.0)
            
            let tableView = LittleKanbanTableView<LittleKanbanCellItem>(frame: CGRect(x: x, y: 0, width: ScreenWidth - 60.0, height: littleKanbanScrollView.height - 80.0))
            
            tableView.backgroundColor = UIColor.clear
            tableView.layer.cornerRadius = 5.0
            tableView.layer.masksToBounds = true
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            
            littleKanbanScrollView.addSubview(tableView)
            littleKanbanColumnsAsTableViews.append(tableView)
        }
        
        littleKanbanScrollView.layer.masksToBounds = false
        littleKanbanScrollView.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Die delegate-Methode für die ScrollView, die aufgerufen wird, wenn der User die ScrollView bewegt.
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == littleKanbanScrollView {
            let x = scrollView.contentOffset.x
                print(x)
        }
    }
}
