//
//  String.swift
//  countdown
//
//  Created by Mikhail Chudaev on 18.06.2023.
//

import Foundation

extension String{
    
    subscript(bounds: CountableRange<Int>) -> String {
        
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        
        return String(self[start..<end])
    }
}
