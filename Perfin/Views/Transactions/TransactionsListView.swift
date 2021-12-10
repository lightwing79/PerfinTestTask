//
//  TransactionsListView.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import SwiftUI
import CoreData

struct TransactionsListView: View {
    
    @State var logToEdit: Transaction?
    
    @Environment(\.managedObjectContext)
    var context: NSManagedObjectContext
    
    @FetchRequest(
        entity: Transaction.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Transaction.date, ascending: false)
        ]
    )
    private var result: FetchedResults<Transaction>
    
    init(predicate: NSPredicate?, sortDescriptor: NSSortDescriptor) {
        let fetchRequest = NSFetchRequest<Transaction>(entityName: Transaction.entity().name ?? "Transaction")
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        _result = FetchRequest(fetchRequest: fetchRequest)
    }
    
    var body: some View {
        List {
            ForEach(result) { (log: Transaction) in
                Button(action: {
                    self.logToEdit = log
                }) {
                    HStack(spacing: 16) {

                        VStack(alignment: .leading, spacing: 8) {
                            Text(log.nameText).font(.headline)
                            Text(log.dateText).font(.subheadline)
                        }
                        Spacer()
                        Text(log.amountText).font(.headline)
                    }
                    .padding(.vertical, 4)
                }
                
            }
               
            .onDelete(perform: onDelete)
            .sheet(item: $logToEdit, onDismiss: {
                self.logToEdit = nil
            }) { (log: Transaction) in
                TransactionsFormView(
                    logToEdit: log,
                    context: self.context,
                    name: log.name ?? "",
                    amount: log.amount?.doubleValue ?? 0,
                    category: Category(rawValue: log.category ?? "") ?? .food,
                    date: log.date ?? Date()
                )
            }
        }
    }
    
    private func onDelete(with indexSet: IndexSet) {
        indexSet.forEach { index in
            let log = result[index]
            context.delete(log)
        }
        try? context.saveContext()
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        let stack = CoreDataStack(containerName: "Perfin")
        let sortDescriptor = TransactionSort(sortType: .date, sortOrder: .descending).sortDescriptor
        return TransactionsListView(predicate: nil, sortDescriptor: sortDescriptor)
            .environment(\.managedObjectContext, stack.viewContext)
    }
}
