//
//  parksData.swift
//  app5_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 11/18/20.
//

import Foundation

struct APIData: Codable {
    let data: [Park]
}

struct Park: Codable {
    let name: String
    let designation: String
    let images: [Image]
    let description: String
}

struct Image: Codable {
    let url: String
}
