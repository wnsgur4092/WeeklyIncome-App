//
//  IncomeInputView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 2/10/2022.
//

import SwiftUI

struct DateInputView: View {
    //MARK: - PROPERTIES
    
    @StateObject var vm : DateInputViewModel
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack{
                DatePicker("Pick Date", selection: $vm.date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                    .colorMultiply(Color.pink)
                    .padding()
                    
                
                Spacer()
                
                NavigationLink {
                    TimeInputView()
                } label: {
                    Text("NEXT")
                        .frame(width: 200, height: 80)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                } //: NAVIGATION LINK
            }//: VSTACK
        }//: NAVIGATIONVIEW
    }
}

//MARK: - PREVIEW
struct DateInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DateInputViewModel(isPresented: .constant(false))
        DateInputView(vm: vm)
    }
}
