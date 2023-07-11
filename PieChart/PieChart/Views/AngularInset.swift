//
//  AngularInset.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import Foundation
import SwiftUI
import Charts

struct AngularInset: View {
    private var mobileSales: [MobileSales] = ChartData.chartData()
    var body: some View {
        Chart {
            ForEach(mobileSales, id: \.model) { sale in
                SectorMark(
                    angle: .value("", sale.count),
                    angularInset: 2
                )
                .foregroundStyle(by: .value("Model", sale.model))
            }
        }
    }
}

struct AngularInset_Previews: PreviewProvider {
    static var previews: some View {
        AngularInset()
    }
}
