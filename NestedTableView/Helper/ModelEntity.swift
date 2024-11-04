//
//  ModelEntity.swift
//  NestedTableView
//
//  Created by Aung Kyaw Phyo on 05/11/2024.
//

import Foundation

struct SchoolData {
    let schoolName: String
    var isExpanded: Bool
    let studentData: [StudentData]
}

struct StudentData {
    let name: String
    let age: String
    let gender: String
    let percentage: String
}
