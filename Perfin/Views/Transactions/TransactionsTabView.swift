//
//  TransactionsTabView.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import SwiftUI
import CoreData

struct TransactionsTabView: View {
    
    @Environment(\.managedObjectContext)
        var context: NSManagedObjectContext
    
    @State private var searchText : String = ""
    @State private var searchBarHeight: CGFloat = 0
    @State private var sortType = SortType.date
    @State private var sortOrder = SortOrder.descending
    
    @State var selectedCategories: Set<Category> = Set()
    @State var isAddFormPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {

                SelectSortOrderView(sortType: $sortType, sortOrder: $sortOrder)
                Divider()
                TransactionsListView(predicate: Transaction.predicate(with: Array(selectedCategories), searchText: searchText), sortDescriptor: TransactionSort(sortType: sortType, sortOrder: sortOrder).sortDescriptor)
            }
            .padding(.bottom, searchBarHeight)
            .sheet(isPresented: $isAddFormPresented) {
                TransactionsFormView(context: self.context)
            }
            .navigationBarItems(trailing: Button(action: addTapped) { Text("Add") })
            .navigationBarTitle("Transaction", displayMode: .inline)
        }
    }
    
    func addTapped() {
        isAddFormPresented = true
    }
    
    
    
}

struct LogsTabView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsTabView()
    }
}
