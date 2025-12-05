//
//  Book.swift
//  BookExplorer
//
//  Created by Himidiri Himakanika on 2025-11-20.
//

import Foundation

struct BookResponse: Decodable {
    let results: [Book]
}

struct Book : Identifiable, Decodable {
    let id : Int
    let title: String
    let authors: [Author]
    let summaries: [String]
    let downloadCount : Int
    let imageURL: URL?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case authors
        case summaries
        case downloadCount = "download_count"
        case formats
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        authors = try container.decode([Author].self, forKey: .authors)
        summaries = try container.decode([String].self, forKey: .summaries)
        downloadCount = try container.decode(Int.self, forKey: .downloadCount)
        
        if let formats = try? container.decode(Formats.self, forKey: .formats),
           let jpegString = formats["image/jpeg"],
           let url = URL(string: jpegString) {
            imageURL = url
        } else {
            imageURL = nil
        }
    }

    init(id: Int, title: String, authors: [Author], summaries: [String], downloadCount: Int, imageURL: URL?) {
        self.id = id
        self.title = title
        self.authors = authors
        self.summaries = summaries
        self.downloadCount = downloadCount
        self.imageURL = imageURL
    }
}

struct Author: Identifiable, Decodable {
    let id = UUID()
    let name: String
    let birthYear: Int
    let deathYear: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case deathYear = "death_year"
    }
}

private struct Formats: Decodable {
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int? { nil }
        init?(intValue: Int) { nil }
    }
    
    private var values: [String: String] = [:]
    
    subscript(key: String) -> String? {
        return values[key]
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var tempValues: [String: String] = [:]
        for key in container.allKeys {
            if let value = try? container.decode(String.self, forKey: key) {
                tempValues[key.stringValue] = value
            }
        }
        values = tempValues
    }
}

extension Book {
    static var sample: Book {
        Book(
            id: 1,
            title: "Sample Book",
            authors: [
                Author(name: "Sample Author", birthYear: 1980, deathYear: nil)
            ],
            summaries: [
                "Sample Summary, Line 1",
                "Sample Summary, Line 2"
            ],
            downloadCount: 100,
            imageURL: URL(string: "https://www.gutenberg.org/cache/epub/84/pg84.cover.medium.jpg")
        )
    }
}

