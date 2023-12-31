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
                .annotation(position: .overlay, content: {
                    Text("\(sale.count)")
                        .font(.headline)
                        .foregroundStyle(.white)
                })
                .foregroundStyle(by: .value("Model", sale.model))
            }
        }
        .padding()
    }
}

struct AngularInset_Previews: PreviewProvider {
    static var previews: some View {
        AngularInset()
    }
}
