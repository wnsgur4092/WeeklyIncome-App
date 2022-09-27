//
//  OnBoardingView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI

struct OnBoardingView: View {
    //MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    @AppStorage("wage") var userWage : String = "20"
    @State var wage : String = ""



    //MARK: - FUNCTION
    func saveWage(){
        UserDefaults.standard.set(self.wage, forKey: "UserWage")
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Text("Please enter your hourly wage".uppercased())
            HStack(alignment: .center){
                Text("$")
                TextField("Wage", text: $wage)

                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(10)
                    .frame(width: 80, height: 80, alignment: .center)
                
            } //: HSTACK
            
            //MARK: - BUTTON
            Button {
                saveWage()
                isOnboarding = false
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
            
        } //: VSTACK
        .padding()
        
        
        .cornerRadius(10)

        
    }
}

//MARK: - PREIVEW
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
