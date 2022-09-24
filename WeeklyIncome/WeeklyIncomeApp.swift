//
//  WeeklyIncomeApp.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI

@main
struct WeeklyIncomeApp: App {
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding == true {
                OnBoardingView()
            } else {
                ContentView()
            }
        }
    }
}
