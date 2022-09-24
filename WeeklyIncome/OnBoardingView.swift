//
//  OnBoardingView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 24/9/2022.
//

import SwiftUI

struct OnBoardingView: View {
    //MARK: - PROPERTIES

    @State private var wage : String = ""

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
            StartButtonView()
            
        } //: VSTACK
    }
}

//MARK: - PREIVEW
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
