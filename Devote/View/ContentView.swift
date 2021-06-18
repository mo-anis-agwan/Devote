//
//  ContentView.swift
//  Devote
//
//  Created by Anis on 17/06/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK:- Properties
    
    //MARK:- Fetching data
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    //MARK:- Function
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //MARK:- Body
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                }
                .onDelete(perform: deleteItems)
            } //: List
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarLeading, content: {
                    EditButton()
                })
                #endif

                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                })
        } //: toolbar
        } //: Navigation
    }
}

    //MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
