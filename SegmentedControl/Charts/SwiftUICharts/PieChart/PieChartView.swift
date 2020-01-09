//
//  PieChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartView : View {
    public var data: [Double]
    public var names: [String]
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var formSize:CGSize
    public var dropShadow: Bool

    public init(data: [Double], names: [String], title: String, legend: String? = nil, style: ChartStyle = Styles.pieChartStyleOne, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true ){
        self.data = data
        self.names = names
        self.title = title
        self.legend = legend
        self.style = style
        self.formSize = form!
        self.dropShadow = dropShadow!
    }
    
    public var body: some View {
        ZStack{
            Rectangle()
                .fill(self.style.backgroundColor)
            VStack(alignment: .leading){
                HStack{
                    Text(self.title)
                        .font(.headline)
                        .foregroundColor(self.style.textColor)
                    Spacer()
                    Image(systemName: "chart.pie.fill")
                        .imageScale(.large)
                        .foregroundColor(self.style.legendTextColor)
                }.padding()
                PieChartRow(names: names, data: data, backgroundColor: self.style.backgroundColor)
                    .foregroundColor(self.style.accentColor).padding(self.legend != nil ? 0 : 12).offset(y:self.legend != nil ? 0 : -10)
                if(self.legend != nil) {
                    Text(self.legend!)
                        .font(.headline)
                        .foregroundColor(self.style.legendTextColor)
                        .padding()
                }
                
            }
        }
    }
}
