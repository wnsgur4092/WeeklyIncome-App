//
//  WeeklyIncomeApp.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI

@main
struct WeeklyIncomeApp: App {
    
    let persistenceController = WagePersistenceController.shared
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    
    var body: some Scene {
        WindowGroup {
            let vm = IncomeListViewModel()
            IncomeListView(vm: vm )
        }
    }
}
