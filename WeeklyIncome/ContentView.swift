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
    @State var savedWage : String = ""
    @State private var timestamp = Date()
    
    private let itemFormatter: DateFormatter = {
         let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter

    }()
    
    
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
    
    func getWage(){
        savedWage = "\(UserDefaults.standard.string(forKey: "UserWage") ?? "")"
    }
    
    func wageCalculator( totalTime : String, hourlyWage : String) -> String {
        guard let totalTimeDouble = Double(totalTime),
              let hourlyWageDouble = Double(savedWage)
             
        else { return " " }
        
        let wagePerDay = totalTimeDouble * hourlyWageDouble

        return "\(wagePerDay)"
    }
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("Hourly Wage: ")
                    Text("$ \(savedWage)")
                }
                List {
                    ForEach(self.items, id: \.self) { item in
                        HStack {
                            Text(item.timestamp ?? Date.now, formatter: itemFormatter)
                            Text(item.totalTime ?? "")
                            Spacer()
                            Text("$\(wageCalculator(totalTime: item.totalTime ?? "" ,hourlyWage: savedWage))")
                            
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
            .onAppear(perform: {
                getWage()
            })
            .navigationTitle("Weekly Calendar")
        } //: NAVIGATION VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, WagePersistenceController.preview.container.viewContext)
    }
}


