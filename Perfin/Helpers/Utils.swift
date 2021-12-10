//
//  Utils.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import Foundation

struct Utils {
    
    static let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter
    }()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }()
    
}
