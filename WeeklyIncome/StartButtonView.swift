//
//  StartButtonView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI

struct StartButtonView: View {
    //MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    
    @State private var wage : String = ""
    
    //Error
    @State private var errorTitle : String = ""
    @State private var errorShowing : Bool = false
    @State private var errorMessage : String = ""
    
    //MARK: - FUNCTION
    func enterWage() {
        if self.wage != "" {
            self.wage = wage
        } else {
            self.errorShowing = true
            self.errorMessage = "Make sure to enter proper wage"
            self.errorTitle = "Invalid Input"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        Button {
            isOnboarding = false
            enterWage()
        } label: {
            HStack(spacing : 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            } //: HSTACK
        } //: BUTTON LABEL
        .padding(.horizontal, 16.0)
        .padding(.vertical, 10)
        .background(
            Capsule().strokeBorder(lineWidth: 2.25).foregroundColor(.green)
        )
        .tint(.green)
    } //: BUTTON
}

//MARK: - PREVIEW

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
    }
}
