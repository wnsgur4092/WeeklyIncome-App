//
//  AddView.swift
//  WeeklyIncome
//
//  Created by JunHyuk Lim on 26/9/2022.
//

import SwiftUI

struct AddView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var startHour : String = "6"
    @State private var startMinute : String = "0"
    @State private var endHour : String = "6"
    @State private var endMinute : String = "0"
    @State private var breakTime : String = "0"
    @State private var totalHour : String = "0"
    @State private var totalTime : String = "0"
    
    var hours : [String] = ["6","7","8","9","10","11","12","13","14","15","16","17"]
    var minutes : [String] = ["0", "15", "30", "45"]
    
    @State private var errorShowing : Bool = false
    @State private var errorTitle : String = ""
    @State private var errorMessage : String = ""
    
    //MARK: - FETCHING DATA
    
    
    //MARK: - FUNCTION
    func calculator( startHour : String, startMinute : String, endHour: String, endMinute : String, breakTime : String) -> String {
        guard let startHourDouble = Double(startHour),
              let startMinuteDouble = Double(startMinute),
              let endHourDouble = Double(endHour),
              let endMinuteDouble = Double(endMinute),
              let breakTimeDouble = Double(breakTime)
        else { return " " }
        
        let start = startHourDouble + startMinuteDouble / 60
        let end = endHourDouble + endMinuteDouble / 60
        let breakHour = breakTimeDouble / 60
        let totalHour = end - start - breakHour
        
        
        return "\(totalHour)"
    }
    
    func addItem() {
        let totalTime = calculator(startHour: startHour, startMinute: startMinute, endHour: endHour, endMinute: endMinute, breakTime: breakTime)
        
        let totalTimeDouble = (totalTime as NSString).doubleValue
        
        if totalTimeDouble > 0 {
            let item =  Item(context: viewContext)
            item.totalTime = totalTime
            
            do{
                try viewContext.save()
            } catch {
                print(error)
            }
            self.dismiss()
            
        } else {
            self.errorShowing = true
            self.errorTitle = "Invalid Total Time"
            self.errorMessage = "Make sure to enter proper time"
        }
        
        
    }
    
    
    
    //MARK: - BODY
    var body: some View {
        
        VStack(spacing: 10) {
            Text("Start Time")
                .font(.system(size:24, weight:.bold, design: .default))
                .padding()
                .foregroundColor(.green)
            HStack {
                Picker("Start Hour", selection: $startHour) {
                    ForEach(hours, id:\.self) { item in
                        Text(item)
                    }
                }
                
                Picker("Start Minute", selection: $startMinute) {
                    ForEach(minutes, id:\.self) { item in
                        Text(item)
                    }
                }
            }
            
            Text("End Time")
                .font(.system(size:24, weight:.bold, design: .default))
                .padding()
                .foregroundColor(.red)
            HStack {
                Picker("End Hour", selection: $endHour) {
                    ForEach(hours, id:\.self) { item in
                        Text(item)
                    }
                }
                
                Picker("End Minute", selection: $endMinute) {
                    ForEach(minutes, id:\.self) { item in
                        Text(item)
                    }
                }
            }
            Text("Break Time")
                .font(.system(size:24, weight:.bold, design: .default))
            
            Picker("Break", selection: $breakTime) {
                ForEach(minutes, id:\.self) { item in
                    Text(item)
                }
            }
            
            Text("Total Time")
            Text(calculator(startHour:startHour, startMinute:startMinute, endHour:endHour, endMinute: endMinute, breakTime: breakTime))
            
            Button {
                addItem()
                
            } label: {
                Text("Save")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(9)
                    .foregroundColor(.white)
                    .padding()
            } //: SAVE BUTTON
            
        } //: VSTACK
        .alert(isPresented: $errorShowing) {
            Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
        }
        
    }
    
}

//MARK: - PREVIEW
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
