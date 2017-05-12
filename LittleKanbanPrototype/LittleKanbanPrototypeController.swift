//
//  ViewController.swift
//  LittleKanbanPrototype
//
//  Created by admin on 09.05.17.
//  Copyright © 2017 FH Rosenheim. All rights reserved.
//

import UIKit

class LittleKanbanPrototypeController: UIViewController {

    //Hier Fragezeichen auf Ausrufezeichen geändert!!!
    var littleKanbanView : LittleKanbanPrototypeView!
    
    public let reuseIdentifier = "LittleKabanCell"
    
    //Ein Long-Gesture-Tap definieren für den Tap auf eine Zelle von einer tableView.
    var longPressGesture: UILongPressGestureRecognizer!
    
    //Diese Variablen brauche ich um das drag&drop-feature zu implementieren.
    var focus: (UITableView, IndexPath)?
    var snapshot: UIView?
    var offset: CGPoint?
    var element : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = LittleKanbanDeepBlue
        
        //x-Wert auf 15 gesetzt, damit die Scrollview in der Horizontalen richtig positioniert wird. Beim Setzen des y-Werts springt die Scrollview nach oben.
        littleKanbanView = LittleKanbanPrototypeView(frame: CGRect(x: 25, y: 75, width: ScreenWidth, height: ScreenHeight), littleKanbanColumnCount: 5)
        
        //Bei einem longpressed-Tap wird die Funktion longPressAction ausgeführt.
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction))
        
        //Anmelden des GestureRecognizers auf der littleKanbanView
        littleKanbanView?.addGestureRecognizer(longPressGesture)
        
        //Diese Property von der ScrollView muss auf false gesetzt werden, damit diese nicht mehr nach oben springt, auch wenn y-Wert in littleKanbanView auf 75 gesetzt wurde.
        self.automaticallyAdjustsScrollViewInsets = false
        
        //Hier werden die Daten meines Custom-Boards, dass aus Tableviews besteht mit den Daten aus dem Model zusammen gekoppelt.
        if let littleKanbanView = littleKanbanView {
            view.addSubViews(views: littleKanbanView)
            
            littleKanbanView.delegate = self
            littleKanbanView.dataSource = self
            
            var i = 0
            
            //Prüfen ob tableViews vorhanden sind:po print(littleKanbanView.littleKanbanColumnsAsTableViews)
            for tableView in littleKanbanView.littleKanbanColumnsAsTableViews {
                
                guard let tableView = tableView as? LittleKanbanTableView<LittleKanbanCellItem> else {return }
                
                tableView.register(LittleKanbanTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
                
                tableView.listItems = LittleKanbanData.data[i]
                
                i += 1
            }
        }
    }
    
    //Diese Methode konvertiert einen CGPoint auf einer tableView in den indexPath der jeweiligen tableView. Diese Funktion mapped noch nicht den richtigen IndexPath von den location-Koordinate.
    //Das bestehende Problem ist: Das nicht das richtige tableView abgegriffen wird!!! Der Filter auf littleKanbanColumnsAsTableViews funktioniert noch nicht richtig.
    func convertPointToIndexPath(_ point: CGPoint) -> (UITableView, IndexPath)? {
        //for tv in littleKanbanView.littleKanbanColumnsAsTableViews {
        //Die UITableViews sind hier drinnen alle, geprüft durch count.
//        for tableViewFrames in littleKanbanView.littleKanbanColumnsAsTableViews {
//            let isInTableView = tableViewFrames.frame.contains(point)
//            let tableView = littleKanbanView.littleKanbanColumnsAsTableViews.filter({$0.frame.contains(point)})
//        }
        //littleKanbanView.littleKanbanColumnsAsTableViews[1].frame.contains(point)
        
        if let tableView = (littleKanbanView.littleKanbanColumnsAsTableViews.filter{ $0.frame.contains(point)}).first{
        
            //Das Problem ist das die anderen TableViews nicht gefiltert werden.
//        for i in 0...littleKanbanView.littleKanbanColumnsAsTableViews.count-1 {
//            let isInTableView = [littleKanbanView.littleKanbanColumnsAsTableViews[i].frame.contains(point)]
//                print(isInTableView)
//                   }
//            let tableView = littleKanbanView.littleKanbanColumnsAsTableViews[3]
            //if let tableView = [tv].filter({ $0.frame.contains(point)} ).first{
            let localPoint = littleKanbanView.convert(point, to: tableView)
            let lastRowIndex = focus?.0 === tableView ? tableView.numberOfRows(inSection: 0) - 1 : tableView.numberOfRows(inSection: 0)
            let indexPath = tableView.indexPathForRow(at: localPoint) ?? IndexPath(row: lastRowIndex, section: 0)
                return (tableView, indexPath)//}
       }
       return nil
    }
    
    func longPressAction(_ gr: UILongPressGestureRecognizer) {
        func cancelAction() {
            gr.isEnabled = false
            gr.isEnabled = true
        }
        
        //Hiermit kriegen ich die Koordinaten auf der littleKanbanView, wenn ich einen longpressed-Tap gemacht habe.
        let location = gr.location(in: littleKanbanView)
        //print(location)
        
        switch gr.state {
            case .began:
                //Hier wird die location vom longpressed-Tap-Gesture in den indexPath mit der jeweiligen tableView konvertiert. Hier kann ein Breakpoint zur Überprüfung der Daten gesetzt werden.
                guard let (tableView, indexPath) = convertPointToIndexPath(location) else { cancelAction(); return }
                guard tableView.cellForRow(at: indexPath) != nil else { cancelAction(); return }
            
                //Code für Testzwecke!!!
                //let element = LittleKanbanData.data[0].remove(at: indexPath.row)
//                print(element)
                
                //Ab hier ist der Code, um eine Zelle aufzuheben!!!
                let cell = tableView.cellForRow(at: indexPath)!
                offset = gr.location(in: cell)
            
                let snapshot = cell.snapshotView(afterScreenUpdates: true)
                snapshot?.frame = littleKanbanView.convert(cell.frame, to: cell.superview)
                littleKanbanView.addSubview(snapshot!)
                self.snapshot = snapshot
            
                focus = (tableView, indexPath)
                tableView.reloadRows(at: [indexPath], with: .fade)
            //Dieser case erlaubt es die jeweilige Zelle aufzunehmen und zu verschieben.
            case .changed:
                guard let focus = focus else { cancelAction(); return }
            
                var offsetLocation = location
                offsetLocation.x -= offset!.x
                offsetLocation.y -= offset!.y
                snapshot!.frame.origin = offsetLocation
            
                guard let (tableView, indexPath) = convertPointToIndexPath(location) else { return }
            
                if tableView == focus.0 {
                    let oldIndexPath = focus.1
                    self.focus = (tableView, indexPath)
                    tableView.moveRow(at: oldIndexPath, to: indexPath)
                } else {
                    let (oldTableView, oldIndexPath) = focus
                    self.focus = (tableView, indexPath)
                    oldTableView.deleteRows(at: [oldIndexPath], with: .fade)
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
            case .ended, .failed, .cancelled:
                guard let _ = focus else { return }
            
                if let (tableView, indexPath) = convertPointToIndexPath(location) ?? focus {
                    self.focus = nil
                    
                    //Code für Testzwecke!!!
//                    if tableView === littleKanbanView.littleKanbanColumnsAsTableViews.first { LittleKanbanData.data.insert(element!, at: indexPath.row)}
                
            
                element = nil
                self.snapshot?.removeFromSuperview()
                self.snapshot = nil
            
                tableView.reloadRows(at: [indexPath], with: .fade)
                }
            default:
                break
        }
    }
}

extension LittleKanbanPrototypeController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? LittleKanbanTableView<LittleKanbanCellItem>,
        let count = tableView.listItems?.count
            else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = LittleKanbanSectionView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 60.0))
        //guard let tableView = tableView as? LittleKanbanTableView<LittleKanbanCellItem> else { return view }
        //Hier kann jetzt auch der Titel einer Kanbanspalte gesetzt werden.
        view.title = "helloWorld"
        return view
    }
    
    //Hier werden die Daten der Zellen aktualisiert oder geladen.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = tableView as? LittleKanbanTableView<LittleKanbanCellItem> else {
            fatalError("TableView False")}
        guard let item = tableView.listItems?[indexPath.row] else {fatalError("No Data")}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? LittleKanbanTableViewCell else {
            return LittleKanbanCellViewModel.initCell(item: item, reuseIdentifier: reuseIdentifier)
        }
        
        if let (tv, ip) = focus, tv === tableView && ip == indexPath {
            cell.alpha = 0.0
            cell.contentView.alpha = 0.0
        } else {
            cell.alpha = 1.0
            cell.contentView.alpha = 1.0
        }
        
        return LittleKanbanCellViewModel.updateCell(item: item, cell: cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

