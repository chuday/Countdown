//
//  AppViewModel.swift
//  countdown
//
//  Created by Mikhail Chudaev on 18.06.2023.
//

import Foundation

class AppViewModel: ObservableObject {
    
    @Published var mainText = ""
    @Published var endDate = Date.now.formatDate()
    
    let userDefaults = UserDefaults.standard
    
    init() {
        getText()
    }
    
    func saveNewDateText(text: String , date: Date) {
        userDefaults.set(text, forKey: "text")
        userDefaults.set(date, forKey: "endDate")
        
        setText(text: text, date: date)
    }
    
    private func setText(text: String , date: Date) {
        if let formattedText = formatText(text: text, date: date) {
            self.mainText = formattedText
            self.endDate = date.formatDate()
        }
    }
    
    private func getText() {
        if let saveText = userDefaults.string(forKey: "text"), let date = userDefaults.object(forKey: "endDate") as? Date {
            setText(text: saveText, date: date)
        }
    }
    
    private func formatText(text: String, date: Date) -> String? {
        
        guard let range = text.range(of: "{date}") else { return nil }
        
        let startPosition = text.distance(from: text.startIndex, to: range.lowerBound)
        let endPosition = text.distance(from: text.startIndex, to: range.upperBound)
        
        let begin = text[0..<startPosition]
        let endText = text[endPosition..<text.count]
        
        let diffDate = date.getDifference().getNumberText()
        
        return begin + diffDate + endText
    }
}
