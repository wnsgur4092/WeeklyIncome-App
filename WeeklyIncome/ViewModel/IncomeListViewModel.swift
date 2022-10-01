//
//  IncomeListViewModel.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 1/10/2022.
//

import Foundation

final class IncomeListViewModel : ObservableObject {
    @Published var list : [Income] = Income.list
    @Published var dic : [String : [Income]] = [:]
    
    init() {
        self.dic = Dictionary(grouping: self.list, by: { $0.monthlyIdentifier})
    }
    
    var keys : [String] {
        return dic.keys.sorted{ $0 < $1}
    }
}
