//
//  Song.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

class Song {
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    static let dummyData = [
        Song(
            name: "Dark Necessities",
            imageName: "rhcp"
        ),
        Song(
            name: "Do I wanna Know?",
            imageName: "arctic monkeys"
        ),
        Song(
            name: "Voodoo Child",
            imageName: "jimi hendrix"
        ),
        Song(
            name: "Another Brick in the Wall",
            imageName: "pink floyd"
        ),
        Song(
            name: "Sweet child o' mine",
            imageName: "guns n roses"
        ),
        Song(
            name: "Chlorine",
            imageName: "twenty one pilots"
        ),
        Song(
            name: "Shine on You",
            imageName: "pink floyd"
        ),
        Song(
            name: "All Along the Watchtower",
            imageName: "jimi hendrix"
        ),
        Song(
            name: "Heathens",
            imageName: "twenty one pilots"
        )
    ]
}
