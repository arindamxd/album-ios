//
//  Album.swift
//  Album
//
//  Created by Arindam Karmakar on 04/10/23.
//

import Foundation

// MARK: Album

struct Album: Codable {
    let id: Int
    let title: String
}

struct AlbumContent: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
