//
//  Person.swift
//  GenericTableViewProject
//
//  Created by Bruno Lopes de Mello on 25/01/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import Foundation

struct Person {
    
    let name: String
    
    static var stubPerson: [Person] {
        return [
            Person(name: "Mark Hamill"),
            Person(name: "Harrison Ford"),
            Person(name: "Carrie Fisher"),
            Person(name: "Hayden Christensen"),
            Person(name: "Ewan McGregor"),
            Person(name: "Natalie Portman"),
            Person(name: "Liam Neeson")
        ]
    }
}

let personsVC = GenericTableViewController(items: Person.stubPerson,
                                           configure: { (cell: UITableViewCell, person) in
                                            cell.textLabel?.text = person.name
}) { (person) in
    print(person.name)
}

