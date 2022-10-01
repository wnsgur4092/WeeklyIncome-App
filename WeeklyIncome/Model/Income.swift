//
//  Income.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 1/10/2022.
//

import Foundation

struct Income : Identifiable, Codable {
    var id = UUID()
    var date : String
    var totalHour : String
    var todayIncome : String
}

extension Income {
    private var dateComponent : DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        let date = formatter.date(from: self.date)
        let dc = calendar.dateComponents([.year, .month], from: date!)
        
        return dc
        
    }
    
    var monthlyIdentifier : String {
        return "\(dateComponent.year!)-\(dateComponent.month!)"
    }
    
}

//MARK: - Dummy Data
extension Income {
    static let list : [Income] = [
        Income(date: "2022-07-01", totalHour: "8.5", todayIncome: "200"),
        
        Income(date: "2022-08-01", totalHour: "8.5", todayIncome: "200"),
        
        Income(date: "2022-09-01", totalHour: "8.5", todayIncome: "200"),
        Income(date: "2022-09-03", totalHour: "9.0", todayIncome: "250"),
        Income(date: "2022-09-25", totalHour: "10.0", todayIncome: "260")
    ]
}
