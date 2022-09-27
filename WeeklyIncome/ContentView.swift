//
//  ContentView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var showingAddView : Bool = false
    @State private var showingWage : String = ""
    var finalWage : String = ""

    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    
    //MARK: - FETCHING DATA
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    
    //MARK: - FUNCTION
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
    
    
    //MARK: - BODY
    var body: some View {
        VStack {
//            Text(wage ?? "__")
            List {
                ForEach(self.items, id: \.self) { item in
                    HStack {
                        Text(item.totalTime ?? "")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            
            //: ADD BUTTON
            Button {
                self.showingAddView.toggle()

            } label: {
                Image(systemName: "plus")
            }
            .sheet(isPresented: $showingAddView) {
                AddView()
                
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, WagePersistenceController.preview.container.viewContext)
    }
}


