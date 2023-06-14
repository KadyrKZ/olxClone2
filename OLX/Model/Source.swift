//
//  Source.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

struct Source {
    static func allPhotos() ->[Photo]{
        [.init(id: 1, imageName: "Phone"),
         .init(id: 2, imageName: "Laptop"),
         .init(id: 3, imageName: "Job"),
         .init(id: 4, imageName: "House"),
         .init(id: 5, imageName: "Hobbi"),
         .init(id: 6, imageName: "Car"),
         .init(id: 7, imageName: "Animal"),
         .init(id: 8, imageName: "Free")
         
        ]
    }
    static func rundomPhoto(with count: Int) -> [Photo]{
        return (0..<count).map { _ in allPhotos().randomElement()!}
    }
}

struct Photo {
    let id: Int
    let imageName: String
}
struct SectionPhoto{
    let sectionName: String
    var photos: [Photo]
}
