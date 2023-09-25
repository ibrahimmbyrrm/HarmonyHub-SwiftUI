//
//  TrackDetail.swift
//  HarmonyHub
//
//  Created by İbrahim Bayram on 1.09.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

protocol TrackCellProperties : PreviewPlayable {
    var title : String {get set}
    var album : GeneralAlbum {get set}
    var artist : GeneralArtist {get set}
}

struct GeneralAlbum : Codable {
    var id : Int
    var coverBig,coverXl : String?
    enum CodingKeys: String, CodingKey {
        case id
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
    }
}

struct GeneralArtist : Codable {
    var id : Int
    var name : String
    var pictureMedium : String?
    
    enum CodingKeys : String,CodingKey {
        case id
        case name
        case pictureMedium = "picture_medium"
    }
}

// MARK: - Welcome
struct TrackDetail: Codable,TrackCellProperties, Equatable {
    static func == (lhs: TrackDetail, rhs: TrackDetail) -> Bool {
        return lhs.id == rhs.id
    }
    var id: Int
    let readable: Bool
    var title, titleShort, titleVersion, isrc: String
    let link, share: String
    let duration, trackPosition, diskNumber, rank: Int
    let releaseDate: String
    let explicitLyrics: Bool
    let explicitContentLyrics, explicitContentCover: Int
    var preview: String
    let bpm, gain: Double
    let availableCountries: [String]
    let contributors: [TrackArtists]
    let md5Image: String
    var artist: GeneralArtist
    var album: GeneralAlbum
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, readable, title
        case titleShort = "title_short"
        case titleVersion = "title_version"
        case isrc, link, share, duration
        case trackPosition = "track_position"
        case diskNumber = "disk_number"
        case rank
        case releaseDate = "release_date"
        case explicitLyrics = "explicit_lyrics"
        case explicitContentLyrics = "explicit_content_lyrics"
        case explicitContentCover = "explicit_content_cover"
        case preview, bpm, gain
        case availableCountries = "available_countries"
        case contributors
        case md5Image = "md5_image"
        case artist, album, type
    }
}

// MARK: - Album
struct TrackAlbum: Codable {
    let id: Int
    let title: String
    let link, cover: String
    var coverSmall, coverMedium, coverBig, coverXl: String
    let md5Image, releaseDate: String
    let tracklist: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, link, cover
        case coverSmall = "cover_small"
        case coverMedium = "cover_medium"
        case coverBig = "cover_big"
        case coverXl = "cover_xl"
        case md5Image = "md5_image"
        case releaseDate = "release_date"
        case tracklist, type
    }
}

// MARK: - Artist
struct TrackArtists: Codable {
    let id: Int
    let name: String
    let link, share, picture: String
    let pictureSmall, pictureMedium, pictureBig, pictureXl: String
    let radio: Bool
    let tracklist: String
    let type: String
    let role: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, link, share, picture
        case pictureSmall = "picture_small"
        case pictureMedium = "picture_medium"
        case pictureBig = "picture_big"
        case pictureXl = "picture_xl"
        case radio, tracklist, type, role
    }
}

extension TrackDetail {
    var typeAndDate : String {
        return "\(self.type.capitalized) - \(self.releaseDate.prefix(4))"
    }
}
