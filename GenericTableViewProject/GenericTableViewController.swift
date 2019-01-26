//
//  GenericTableViewController.swift
//  GenericTableViewProject
//
//  Created by Bruno Lopes de Mello on 25/01/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import Foundation

class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    
    var items: [T]
    var configure: (Cell, T) -> Void
    var selectHandle:(T) -> Void
    
    init(items: [T], configure: @escaping (Cell, T) -> Void,
         selectHandle: @escaping (T) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandle = selectHandle
        super.init(style: .plain)
        self.tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell {
            let item = items[indexPath.row]
            configure(cell, item)
            return cell
        }
        
        return Cell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        selectHandle(item)
    }
}

class SubtitleTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

