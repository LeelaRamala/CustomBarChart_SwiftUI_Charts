//
//  TimesData.swift
//  BarChartExample
//
//  Created by R, Leelajyothi on 17/08/23.
//

import Foundation

struct BarData: Identifiable {
    let duration: Int
    let taxiData: String
    let averageDuration: Int
    let category: String
    
    init(duration: Int, taxiData: String, averageDuration: Int = 0, category: String = "normal") {
        self.duration = duration
        self.taxiData = taxiData
        self.averageDuration = averageDuration
        self.category = category
    }
    
    var id: String {
        return taxiData
    }
}


struct TaxiTimesData {
    static let barData = [
        BarData(duration: 2, taxiData: "0930"),
        BarData(duration: 9, taxiData: "1000", averageDuration: 5),
        BarData(duration: 5, taxiData: "1030"),
        BarData(duration: 8, taxiData: "1100"),
        BarData(duration: 9, taxiData: "1130"),
        BarData(duration: 6, taxiData: "1200"),
        BarData(duration: 7, taxiData: "1230"),
        BarData(duration: 8, taxiData: "1300")
    ]
    
}
