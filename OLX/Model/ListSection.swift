//
//  ListSection.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 13.06.2023.
//

import Foundation

enum ListSection {
    case sales([ListItem])
    case category([ListItem])
    case example([ListItem])
    
    var items: [ListItem]{
        switch self {
        case .sales(let items),
                .category(let items),
                .example(let items):
            return items
        }
    }
    var count: Int {
        items.count
    }
    var title: String{
        switch self{
        case .sales(_):
            return ""
        case .category(_):
            return "Category"
        case .example(_):
            return "Example"
        }
    }
}
