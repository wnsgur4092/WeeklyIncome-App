//
//  IncomeListCell.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 1/10/2022.
//

import SwiftUI

struct IncomeListCell: View {
    //MARK: - PROEPERTIES
    var incomeList : Income
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text(incomeList.date)
                    .font(.system(.headline, weight: .bold))
                    .lineLimit(3)
                    .foregroundColor(.gray)
                
                Spacer()
            } //: HSTACK
            
            
            HStack(alignment:.center, spacing: 20){
                
                Text(incomeList.title)
                    .font(.system(.title3, weight:.bold))
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .frame(maxWidth: 80)
                
                Spacer()
                
                Text("\(incomeList.totalHour)h")
                    .font(.system(.title3, weight:.bold))
                    .foregroundColor(.black)
                
                
                Spacer()
                
                Text("$\(incomeList.todayIncome)")
                    .font(.system(.title3, weight: .bold))
                    .foregroundColor(.pink)
                
                
                Image(systemName: "chevron.right")
                
            } //: HSTACK
            .multilineTextAlignment(.leading)
            .padding()
            .frame(minWidth: 80, maxWidth: .infinity, maxHeight: 30)
        } //: VSTACK
    }
}


struct IncomeListCell_Previews: PreviewProvider {
    static var previews: some View {
        IncomeListCell(incomeList: Income.list[1]).previewLayout(.sizeThatFits)
    }
}
