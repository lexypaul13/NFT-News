//
//  News.swift
//  NFT News
//
//  Created by Alex Paul on 4/1/21.
//


//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case totalResults = "totalResults"
        case articles = "articles"
    }
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?

    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case articleDescription = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
}

// MARK: - Source
struct Source: Codable {
    var id: ID?
    var name: Name?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

enum ID: String, Codable {
    case engadget = "engadget"
    case techcrunch = "techcrunch"
    case theVerge = "the-verge"
}

enum Name: String, Codable {
    case engadget = "Engadget"
    case lifehackerCOM = "Lifehacker.com"
    case techCrunch = "TechCrunch"
    case theVerge = "The Verge"
}
