//
//  CategoryRowView.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import SwiftUI

struct CategoryRowView: View {
    let category: Category
    let sum: Double
    
    var body: some View {
        HStack {
            Text(category.rawValue.capitalized)
            Spacer()
            Text(sum.formattedCurrencyText).font(.headline)
        }
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: .donation, sum: 2500)
    }
}
