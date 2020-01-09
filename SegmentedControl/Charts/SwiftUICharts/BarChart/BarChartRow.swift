//
//  ChartRow.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct BarChartRow : View {
    @State var chosenName: String = ""
    
    var data: [Double]
    public var names: [String]
    public var accentColors: [Color] = [
        Color(.redPigment),
        Color(.turkishAqua),
        Color(.leaguesUnderTheSea),
        Color(.curcumorbitalRing),
        Color(.magentaPurple),
        Color(.puffinsBill),
        Color(.pixelatedGrass),
        Color(.merchantMarineBlue),
        Color(.forgottenPurple),
        Color(.hollyhock),
        Color(.radiantYellow),
        Color(.androidGreen),
        Color(.middeterareanSea),
        Color(.lavenderTea),
        Color(.veryBerry),
        Color(.sunflower),
        Color(.energos),
        Color(.blueMartina),
        Color(.lavenderRose),
        Color(.baraRed)
    ]
    var secondGradientAccentColor: Color?
    var maxValue: Double {
        data.max() ?? 0
    }
    @Binding var touchLocation: CGFloat
    public var body: some View {
        VStack {
            VStack(alignment: .leading) {
                ForEach(0..<self.names.count){ i in
                    HStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(self.accentColors[i])
                        if self.chosenName == self.names[i] {
                            Text("\(self.names[i]) - \(Int(self.data[i]))")
                                .font(Font.system(.body))
                                .foregroundColor(.black)
                                .bold()
                        } else {
                            Text("\(self.names[i]) - \(Int(self.data[i]))")
                                .font(Font.system(.body))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: (geometry.frame(in: .local).width-22)/CGFloat(self.data.count * 3)){
                    ForEach(0..<self.data.count) { i in
                        BarChartCell(value: self.normalizedValue(index: i), index: i, width: Float(geometry.frame(in: .local).width - 22), numberOfDataPoints: self.data.count, accentColor: self.accentColors[i], secondGradientAccentColor: self.accentColors[i], touchLocation: self.$touchLocation)
                            .scaleEffect(self.touchLocation > CGFloat(i)/CGFloat(self.data.count) && self.touchLocation < CGFloat(i+1)/CGFloat(self.data.count) ? CGSize(width: 1.4, height: 1.1) : CGSize(width: 1, height: 1), anchor: .bottom)
                            .animation(.spring())

                    }
                }
                .padding([.top, .leading, .trailing], 10)
            }
        }
    }
    
    func normalizedValue(index: Int) -> Double {
        guard Double(self.maxValue) != 0 else {
            return 0
        }
        return Double(self.data[index])/Double(self.maxValue)
    }
}
