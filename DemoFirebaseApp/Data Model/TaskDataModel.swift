//
//  TaskDataModel.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Task: Identifiable, Codable, Hashable {
    let id: String
    let title: String
    let completed: Bool
    let description: String
    let quantity: Int
}

