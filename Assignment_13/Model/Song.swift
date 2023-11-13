//
//  Song.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

class Song {
    let artist: String
    let name: String
    let image: UIImage
    
    init(artist: String, name: String, image: UIImage) {
        self.artist = artist
        self.name = name
        self.image = image
    }
    
    static let dummyData = [
        // Pink Floyd Songs:
        Song(
            artist: "Pink Floyd",
            name: "Shine on You Crazy Diamond",
            image: UIImage(named: "Pink_Floyd")!
        ),
        Song(
            artist: "Pink Floyd",
            name: "Comfortably Numb",
            image: UIImage(named: "Pink_Floyd")!
        ),
        Song(
            artist: "Pink Floyd",
            name: "Another One Bites the Dust",
            image: UIImage(named: "Pink_Floyd")!
        ),
        // Jimi Hendrix Songs:
        Song(
            artist: "Jimi Hendrix",
            name: "Purple Haze",
            image: UIImage(named: "Jimi_Hendrix")!
        ),
        Song(
            artist: "Jimi Hendrix",
            name: "Little Wing",
            image: UIImage(named: "Jimi_Hendrix")!
        ),
        Song(
            artist: "Jimi Hendrix",
            name: "Hey Joe",
            image: UIImage(named: "Jimi_Hendrix")!
        ),
        Song(
            artist: "Jimi Hendrix",
            name: "Voodoo Child",
            image: UIImage(named: "Jimi_Hendrix")!
        ),
        // RHCP Songs:
        Song(
            artist: "RHCP",
            name: "Black Summer",
            image: UIImage(named: "RHCP")!
        ),
        Song(
            artist: "RHCP",
            name: "Can't Stop",
            image: UIImage(named: "RHCP")!
        ),
        Song(
            artist: "RHCP",
            name: "Dark Necessities",
            image: UIImage(named: "RHCP")!
        ),
        // Arctic Monkeys Songs:
        Song(
            artist: "Arctic Monkeys",
            name: "Do I Wanna Know?",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        Song(
            artist: "Arctic Monkeys",
            name: "R U Mine?",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        Song(
            artist: "Arctic Monkeys",
            name: "505",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        Song(
            artist: "Arctic Monkeys",
            name: "Why'd You Only Call Me When You're High",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        Song(
            artist: "Arctic Monkeys",
            name: "Knee Socks",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        Song(
            artist: "Arctic Monkeys",
            name: "Arabella",
            image: UIImage(named: "Arctic_Monkeys")!
        ),
        // The Beatles Songs:
        Song(
            artist: "The Beatles",
            name: "All My Loving",
            image: UIImage(named: "The_Beatles")!
        ),
        Song(
            artist: "The Beatles",
            name: "Let it Be",
            image: UIImage(named: "The_Beatles")!
        ),
        Song(
            artist: "The Beatles",
            name: "Hey Jude",
            image: UIImage(named: "The_Beatles")!
        ),
        // Queen Songs:
        Song(
            artist: "Queen",
            name: "We Will Rock You",
            image: UIImage(named: "Queen")!
        ),
        Song(
            artist: "Queen",
            name: "Bohemian Rhapsody",
            image: UIImage(named: "Queen")!
        ),
        Song(
            artist: "Queen",
            name: "Another One Bites the Dust",
            image: UIImage(named: "Queen")!
        ),
        Song(
            artist: "Queen",
            name: "We are the Champions",
            image: UIImage(named: "Queen")!
        ),
        // Guns N Roses Songs:
        Song(
            artist: "Guns N Roses",
            name: "Sweet Child O' Mine",
            image: UIImage(named: "Guns_N_Roses")!
        ),
        Song(
            artist: "Guns N Roses",
            name: "Welcome to the Jungle",
            image: UIImage(named: "Guns_N_Roses")!
        ),
        Song(
            artist: "Guns N Roses",
            name: "Paradise City",
            image: UIImage(named: "Guns_N_Roses")!
        ),
        Song(
            artist: "Guns N Roses",
            name: "Knockin' on Heaven's Door",
            image: UIImage(named: "Guns_N_Roses")!
        ),
        // Led Zeppelin Songs:
        Song(
            artist: "Led Zeppelin",
            name: "Stairway to Heaven",
            image: UIImage(named: "Led_Zeppelin")!
        ),
        Song(
            artist: "Led Zeppelin",
            name: "Whole Lotta Love",
            image: UIImage(named: "Led_Zeppelin")!
        ),
        // Metallica Songs:
        Song(
            artist: "Metallica",
            name: "Nothing Else Matters",
            image: UIImage(named: "Metallica")!
        ),
        Song(
            artist: "Metallica",
            name: "Enter Sandman",
            image: UIImage(named: "Metallica")!
        ),
        // Aerosmith Songs:
        Song(
            artist: "Aerosmith",
            name: "Dream On",
            image: UIImage(named: "Aerosmith")!
        ),
        Song(
            artist: "Aerosmith",
            name: "Come Together",
            image: UIImage(named: "Aerosmith")!
        ),
        // AC/DC Songs:
        Song(
            artist: "AC/DC",
            name: "Back in Black",
            image: UIImage(named: "AC:DC")!
        ),
        Song(
            artist: "AC/DC",
            name: "Highway to Hell",
            image: UIImage(named: "AC:DC")!
        ),
        Song(
            artist: "AC/DC",
            name: "Thunderstruck",
            image: UIImage(named: "AC:DC")!
        )
    ]
}
