//
//  BarVsPie.swift
//  PieChart
//
//  Created by Siddharth Kothari on 11/07/23.
//

import Foundation
import SwiftUI
import Charts

struct BarVsPie: View {
    private var mobileSales: [MobileSales] = ChartData.chartData()
    
    var body: some View {
        VStack(content: {
            Chart {
                ForEach(mobileSales, id: \.model) { sale in
                    BarMark(
                        x: .value("Model", sale.model),
                        y: .value("Count", sale.count)
                    )
                    .foregroundStyle(by: .value("Model", sale.model))
                }
            }
            
            Spacer()
            
            Chart {
                ForEach(mobileSales, id: \.model) { sale in
                    SectorMark(
                        angle: .value("Count", sale.count)
                    )
                    .foregroundStyle(by: .value("Model", sale.model))
                }
            }
        })
        .padding()
    }
}

struct BarVsPie_Previews: PreviewProvider {
    static var previews: some View {
        BarVsPie()
    }
}
