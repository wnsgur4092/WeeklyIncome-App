//
//  IncomeInputViewModel.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 2/10/2022.
//

import Foundation
import SwiftUI
import Combine

final class DateInputViewModel : ObservableObject {
    
    @Published var date : Date = Date()
    @Published var isPresented : Binding<Bool>

    var subscriptions = Set<AnyCancellable>()
    
    init(isPresented : Binding<Bool>){
        self.isPresented = isPresented
        
        $date.sink { date in
            print(">> Selected : \(date)")
        }.store(in: &subscriptions)

        
    }
}
