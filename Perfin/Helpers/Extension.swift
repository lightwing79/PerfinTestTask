//
//  Extension.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import Foundation

extension Double {
    
    var formattedCurrencyText: String {
        return Utils.numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
    
}
