//
//  ChartData.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import Foundation

struct MobileSales {
    let model: String
    let count: Int
}

class ChartData {
    static func chartData() -> [MobileSales] {
        return [
            MobileSales(model: "iPhone 12", count: 200),
            MobileSales(model: "iPhone SE", count: 300),
            MobileSales(model: "iPhone 13", count: 400),
            MobileSales(model: "iPhone 14", count: 1000),
            MobileSales(model: "iPhone 14 Pro", count: 1100)
        ]
    }
}
