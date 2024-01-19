//
//  LinkModel.swift
//  testTask01.24
//
//  Created by Nikolai  on 15.01.2024.
//

import Foundation

// MARK: - TestLink
struct TestLink: Codable {
    let ok: Bool
    let result: TestResult
}

// MARK: - Result
struct TestResult: Codable {
    let path: String
    let url: String
    let title: String
    let description: String
    let authorName: String?
    let views: Int
}
