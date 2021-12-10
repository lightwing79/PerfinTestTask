//
//  Category.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable {
    
    case taxes
    case grocery
    case food
    case donation
    case entertainment
    case health
    case gym
    case transportation
    case utilities
    case other
    
}

extension Category: Identifiable {
    var id: String { rawValue }
}
