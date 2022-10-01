//
//  IncomeListCell.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 1/10/2022.
//

import SwiftUI

struct IncomeListCell: View {
    //MARK: - PROEPERTIES
    var hourlyIncome : Income
    
    //MARK: - BODY
    var body: some View {
        HStack(spacing: 20){
            Text(hourlyIncome.date)
                .font(.system(.headline, weight: .bold))

            Spacer()
            
            Text("\(hourlyIncome.totalHour)h")
                .fontWeight(.semibold)
                
            
            Spacer()
            
            Text("$\(hourlyIncome.todayIncome)")
                .fontWeight(.black)
            
        }
        .foregroundColor(.black)
        .padding()
        .frame(minWidth: 80, maxWidth: .infinity)
    }
}

struct IncomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        IncomeListCell(hourlyIncome: Income.list[0]).previewLayout(.sizeThatFits)
    }
}
