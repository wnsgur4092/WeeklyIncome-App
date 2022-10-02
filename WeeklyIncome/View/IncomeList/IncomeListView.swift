//
//  IncomeListView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 1/10/2022.
//

import SwiftUI

struct IncomeListView: View {
    //MARK: - PROPERTIES
    @StateObject var vm : IncomeListViewModel
    @State var isPresenting : Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    ForEach(vm.keys, id:\.self) { key in
                        Section {
                            let items = vm.dic[key] ?? []
                            let orderedItems = items.sorted(by: {$0.date < $1.date})
                            ForEach(orderedItems) { item in
                                NavigationLink {
                                    IncomeDetailView()
                                } label: {
                                    IncomeListCell(incomeList: item)
                                }
                            } //: LOOP
                        } header: {
                            Text(formattedSectionTitle(key))
                                .frame(width: 300, height: 50)
                                .background(Color.pink)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                                .font(.system(size: 30, weight: .black, design: .default))
                        } //: SECTION
                        .frame(height: 60)
                        .padding()
                    } //: LOOP
                } //: SCROLLVIEW
                
                Button {
                    print("Plus Button Tapped")
                    isPresenting = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                } //: BUTTON
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(Color.pink)
                .cornerRadius(40)
                .padding(.vertical, 10)

            } //: VSTACK
            .navigationTitle("Monthly Income")
            .navigationBarTitleDisplayMode(.large)
        } //: NAVIGATION VIEW
        .sheet(isPresented: $isPresenting) {
            let vm = DateInputViewModel(isPresented: $isPresenting)
            DateInputView(vm: vm)
        }

        
    }
}

//MARK: - EXTENSION
extension IncomeListView {
    private func formattedSectionTitle(_ id : String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap {Int($0)}
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}

//MARK: - PREVIEW
struct IncomeListView_Previews: PreviewProvider {
    static var previews: some View {
        IncomeListView(vm: IncomeListViewModel())
    }
}
