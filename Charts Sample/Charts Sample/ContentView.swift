//
//  ContentView.swift
//  Charts Sample
//
//  Created by Siddharth Kothari on 03/07/23.
//

import SwiftUI
import Charts


struct Profit {
     let department: String
     let profit: Double
 }
    
struct Job {
     let job: String
     let start: Double
     let end: Double
 }

struct ContentView: View {
    
    private var coffeeSales = [
        (name: "Americano", count: 120),
        (name: "Cappuccino", count: 234),
        (name: "Espresso", count: 62),
        (name: "Latte", count: 625),
        (name: "Mocha", count: 320),
        (name: "Affogato", count: 50)
    ]
    
    private var profitData: [Profit] = [
        Profit(department: "Production", profit: 15000),
        Profit(department: "Marketing", profit: 8000),
        Profit(department: "Finance", profit: 10000)
   ]
    
    private var jobData: [Job] = [
        Job(job: "Job 1", start: 0, end: 15),
        Job(job: "Job 2", start: 5, end: 25),
        Job(job: "Job 1", start: 20, end: 35),
        Job(job: "Job 1", start: 40, end: 55),
        Job(job: "Job 2", start: 30, end: 60),
        Job(job: "Job 2", start: 30, end: 60)
    ]
    
    var body: some View {
        
        TabView {
            // Vertical Bar
            Chart {
                ForEach(coffeeSales, id: \.name) { coffee in
                    BarMark(
                        x: .value("Type", coffee.name),
                        y: .value("Cup", coffee.count)
                    )
                    .foregroundStyle(by: .value("Type", coffee.name))
                    //.clipShape(Circle())
                }
            }
            .tabItem {
                //Image(systemName: "house.fill")
                Text("Vertical Bar")
            }
            
            // only x axis:
            Chart {
                ForEach(profitData, id: \.department) { profit in
                    BarMark(
                        x: .value("Cup", profit.profit)
                    )
                    .foregroundStyle(by: .value("Type", profit.department))
                    //.clipShape(Circle())
                }
            }.frame(width: 400, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .tabItem {
                //Image(systemName: "house.fill")
                Text("X axis")
            }
            
            // only y axis:
            Chart {
                ForEach(profitData, id: \.department) { profit in
                    BarMark(
                        y: .value("Cup", profit.profit)
                    )
                    .foregroundStyle(by: .value("Type", profit.department))
                    //.clipShape(Circle())
                }
            }.frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .tabItem {
                //Image(systemName: "house.fill")
                Text("Y axis")
            }

            
            // Interval chart:
            Chart {
                ForEach(jobData, id: \.job) { job in
                    BarMark(
                         xStart: .value("Start Time", job.start),
                        xEnd: .value("End Time", job.end),
                         y: .value("Job", job.job)
                             )
                    .foregroundStyle(by: .value("Type", job.job))
                    //.clipShape(Circle())
                }
            }
            .tabItem {
                //Image(systemName: "house.fill")
                Text("Interval chart")
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
