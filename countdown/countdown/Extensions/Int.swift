//
//  Int.swift
//  countdown
//
//  Created by Mikhail Chudaev on 18.06.2023.
//

import Foundation

extension Int {
    
    func getNumberText() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        switch self {
        case 0:
            return "today"
        case 1:
            return "tomorrow"
        default:
            return formatter.string(for: self) ?? ""
        }
    }
}
