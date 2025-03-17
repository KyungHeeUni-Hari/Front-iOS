//
//  String_Extension.swift
//  Archive
//
//  Created by 이수현 on 2/1/25.
//

import Foundation

extension String {
    // 2025-02-01T05:35:02 -> 2025만 출력
    func prefixBeforeDash() -> String {
        return self.components(separatedBy: "-").first ?? ""
    }
    
    // 2025-02-01T05:35:02 -> (year: 2025, month: 02, week: 1st) 반환
    func getWeekTuple() -> (year: String, month: String, week: String) {
        let date = self.split(separator: "T").first ?? "" // 2025-02-01만 뽑음
        let dateArr = date.split(separator: "-").map{String($0)} // ["2025", "02", "01"]
        let year = dateArr[0]
        let month = dateArr[1]
        let weekInt = (Int(dateArr[2]) ?? 0) / 7 + 1
        var week = ""
        
        switch weekInt {
        case 1:
            week = "1st"
        case 2:
            week = "2nd"
        case 3:
            week = "3rd"
        default:
            week = "4th"
        }
                                
        return (year: year, month: month, week: week)
    }
}
