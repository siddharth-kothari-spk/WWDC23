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
                ForEach(mobileSales, id: \.model) { mobile in
                    BarMark(
                        x: .value("Model", mobile.model),
                        y: .value("Count", mobile.count)
                    )
                    .foregroundStyle(by: .value("Model", mobile.model))
                }
            }
            
            Spacer()
            
            Chart {
                ForEach(mobileSales, id: \.model) { mobile in
                    SectorMark(
                        angle: .value("Count", mobile.count)
                    )
                    .foregroundStyle(by: .value("Model", mobile.model))
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
