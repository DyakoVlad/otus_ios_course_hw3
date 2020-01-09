//
// Repository.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct Repository: Codable {

    public var id: Int?
    public var owner: User?
    public var fullName: String?
    public var language: String?
    public var description: String?
    public var stargazersCount: Int?
    public var watchersCount: Int?
    public var score: Double?

    public init(id: Int?, owner: User?, fullName: String?, language: String?, description: String?, stargazersCount: Int?, watchersCount: Int?, score: Double?) {
        self.id = id
        self.owner = owner
        self.fullName = fullName
        self.language = language
        self.description = description
        self.stargazersCount = stargazersCount
        self.watchersCount = watchersCount
        self.score = score
    }

    public enum CodingKeys: String, CodingKey { 
        case id
        case owner
        case fullName
        case language
        case description
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case score
    }


}
