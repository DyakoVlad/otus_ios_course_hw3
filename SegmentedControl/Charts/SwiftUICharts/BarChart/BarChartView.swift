//
//  ChartView.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct BarChartView : View {
    public var data: [Double]
    public var names: [String]
    public var title: String
    public var legend: String?
    public var style: ChartStyle
    public var formSize:CGSize
    public var dropShadow: Bool

//    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    @State private var touchLocation: CGFloat = -1.0
    @State private var showValue: Bool = false
    @State private var currentValue: Double = 0 {
        didSet{
            if(oldValue != self.currentValue && self.showValue) {
//                selectionFeedbackGenerator.selectionChanged()
                HapticFeedback.playSelection()
            }
        }
    }
    var isFullWidth:Bool {
        return self.formSize == ChartForm.large
    }
    public init(data: [Double], names: [String], title: String, legend: String? = nil, style: ChartStyle = Styles.barChartStyleOrangeLight, form: CGSize? = ChartForm.medium, dropShadow: Bool? = true){
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
                    if(!showValue){
                        Text(self.title)
                            .font(.headline)
                            .foregroundColor(self.style.textColor)
                    }else{
                        Text("\(self.currentValue)")
                            .font(.headline)
                            .foregroundColor(self.style.textColor)
                    }
                    if(self.formSize == ChartForm.large && self.legend != nil && !showValue) {
                        Text(self.legend!)
                            .font(.callout)
                            .foregroundColor(self.style.accentColor)
                            .transition(.opacity)
                            .animation(.easeOut)
                    }
                    Spacer()
                    Image(systemName: "waveform.path.ecg")
                        .imageScale(.large)
                        .foregroundColor(self.style.legendTextColor)
                }.padding()
                BarChartRow(data: data, names: names, touchLocation: self.$touchLocation)
                if self.legend != nil  && self.formSize == ChartForm.medium {
                    Text(self.legend!)
                        .font(.headline)
                        .foregroundColor(self.style.legendTextColor)
                        .padding()
                }
                
            }
        }
        .gesture(DragGesture()
            .onChanged({ value in
                self.touchLocation = value.location.x/self.formSize.width
                self.showValue = true
                self.currentValue = self.getCurrentValue()
            })
            .onEnded({ value in
                self.showValue = false
                self.touchLocation = -1
            })
        )
    }
    
    func getCurrentValue()-> Double {
        let index = max(0,min(self.data.count-1,Int(floor((self.touchLocation*self.formSize.width)/(self.formSize.width/CGFloat(self.data.count))))))
        return self.data[index]
    }
}
