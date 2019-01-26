//
//  Film.swift
//  GenericTableViewProject
//
//  Created by Bruno Lopes de Mello on 25/01/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import Foundation

struct Film {
    let title: String
    let releaseYear: Int
    static var stubFilms: [Film] {
        return [
            Film(title: "Star Wars: A New Hope", releaseYear: 1978),
            Film(title: "Star Wars: Empire Strikes Back", releaseYear: 1982),
            Film(title: "Star Wars: Return of the Jedi", releaseYear:  1984),
            Film(title: "Star Wars: The Phantom Menace", releaseYear: 1999),
            Film(title: "Star Wars: Clone Wars", releaseYear: 2003),
            Film(title: "Star Wars: Revenge of the Sith", releaseYear: 2005)]
    }
}

let filmsVC = GenericTableViewController(items: Film.stubFilms, configure: { (cell: SubtitleTableViewCell, film) in
    cell.textLabel?.text = film.title
    cell.detailTextLabel?.text = "\(film.releaseYear)"
}) { (film) in
    print(film.title)
}
