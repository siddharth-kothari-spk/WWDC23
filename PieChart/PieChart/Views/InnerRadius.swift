//
//  InnerRadius.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import Foundation
import SwiftUI
import Charts


struct InnerRadius: View {
    private var mobileSales: [MobileSales] = ChartData.chartData()
    var body: some View {
        Chart {
            ForEach(mobileSales, id: \.model) { sale in
                SectorMark(
                    angle: .value("", sale.count),
                    innerRadius: .ratio(0.50),
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

struct InnerRadius_Previews: PreviewProvider {
    static var previews: some View {
        InnerRadius()
    }
}
