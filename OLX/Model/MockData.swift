//
//  MockData.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 13.06.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([.init(title: "", image: "Phone"),
                .init(title: "", image: "Phone"),
                .init(title: "", image: "Phone")
        ])
    }()
    
    private let category: ListSection = {
        .sales([.init(title: "Phone", image: "Phone"),
                .init(title: "Phone", image: "Phone"),
                .init(title: "Phone", image: "Phone"),
                .init(title: "Phone", image: "Phone"),
                .init(title: "Phone", image: "Phone")
        ])
    }()
    
    private let example: ListSection = {
        .sales([.init(title: "", image: "Phone"),
                .init(title: "", image: "Phone"),
                .init(title: "", image: "Phone")
        ])
    }()
    
    var pageData: [ListSection]{
        [sales,category,example]
    }
}

