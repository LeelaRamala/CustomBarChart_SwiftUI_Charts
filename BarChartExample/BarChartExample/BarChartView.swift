//
//  ContentView.swift
//  BarChartExample
//
//  Created by R, Leelajyothi on 17/08/23.
//


import SwiftUI
import Charts


struct BarChartView: View {
    let barColor = Color.gray
    let highlightedBarColor = Color.red
    let items = TaxiTimesData.barData
    private let axisFont : Font = Font.system(size: 13, design: .monospaced)
    
    private var maxDuration: Int {
        let value = self.items.max(by: { $0.duration < $1.duration })
        let avgDurationValue = self.items.first{ $0.averageDuration > 0}
        if let maxVal = value?.duration {
            
            if avgDurationValue?.averageDuration ?? 0 > maxVal { return (avgDurationValue?.averageDuration ?? maxVal) }
            else { return maxVal }
        }
        
        return 100
    }

    
    var body: some View {
        Chart (TaxiTimesData.barData) { data in
            
            if data.duration >= data.averageDuration {
                BarMark(
                    x: .value("Time", data.taxiData),
                    y: .value("Duration", data.duration),
                    width: 32.0
                )
                .cornerRadius(4.0)
                .foregroundStyle(barColor)
            }
            
            if data.averageDuration > 0 {
                BarMark(
                    x: .value("Time", data.taxiData),
                    y: .value("Duration",  data.averageDuration),
                    width: 32.0
                )
                .cornerRadius(4.0)
                .position(by: .value("Duration",  data.averageDuration))
                .foregroundStyle(highlightedBarColor)
                
                if data.duration < data.averageDuration {
                    BarMark(
                        x: .value("Time", data.taxiData),
                        y: .value("Duration", data.duration),
                        width: 32.0
                    )
                    .cornerRadius(4.0)
                    .foregroundStyle(barColor)
                }
            }
        }
        .frame(height: 200)
                .chartYScale(domain: 0...(maxDuration + 1))
                .chartYAxis {
                    AxisMarks(position: .leading, values: .automatic(desiredCount: 8, roundLowerBound: true, roundUpperBound: true)) { value in
                        let yValue = value.as(Int.self)!
                        AxisGridLine(centered: false)
                        AxisValueLabel() {
                            Text("\(yValue)")
                                .foregroundColor(.red)
                                .font(axisFont)
                        }
                    }
                }
                .chartXAxis {
                        AxisMarks() { value in
                            let dateVal = value.as(String.self)!
                            AxisGridLine(centered: false)
                            AxisTick(centered: false, length: 5,
                                     stroke: StrokeStyle(lineWidth: 1.0))
                            
                            if value.index % 2 == 0 {
                                AxisValueLabel(centered: false, collisionResolution: .disabled) {
                                    Text(dateVal)
                                        .position(x: 34.0, y: 8.0)
                                        .foregroundColor(.red)
                                        .font(axisFont)
                                }
                            }
                        }
                }
    }
}


struct BarChart: View {
    var body: some View {
               BarChartView()
            .padding(EdgeInsets(top: 0.0, leading: 30.0, bottom: 0.0, trailing: 30.0))
            
    }
}

struct BarChartNewView_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}



