//
//  OuterRadius.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import Foundation
import SwiftUI
import Charts

struct OuterRadius: View {
    private var mobileSales: [MobileSales] = ChartData.chartData()
    var body: some View {
        Chart {
            ForEach(mobileSales, id: \.model) { sale in
                SectorMark(
                    angle: .value("", sale.count),
                    outerRadius: sale.model == "iPhone 14" ? 150 : 120,
                    angularInset: 2
                )
                .foregroundStyle(by: .value("Model", sale.model))
            }
        }
    }
}

struct OuterRadius_Previews: PreviewProvider {
    static var previews: some View {
        OuterRadius()
    }
}
