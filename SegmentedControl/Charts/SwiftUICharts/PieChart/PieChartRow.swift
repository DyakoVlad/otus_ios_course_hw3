//
//  PieChartRow.swift
//  ChartView
//
//  Created by András Samu on 2019. 06. 12..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct PieChartRow : View {
    @State var chosenName: String = ""
    
    public var names: [String]
    public var data: [Double]
    public var backgroundColor: Color
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
    public var slices: [PieSlice] {
        var tempSlices:[PieSlice] = []
        var lastEndDeg:Double = 0
        let maxValue = data.reduce(0, +)
        for slice in data {
            let normalized:Double = Double(slice)/Double(maxValue)
            let startDeg = lastEndDeg
            let endDeg = lastEndDeg + (normalized * 360)
            lastEndDeg = endDeg
            tempSlices.append(PieSlice(startDeg: startDeg, endDeg: endDeg, value: slice, normalizedValue: normalized))
        }
        return tempSlices
    }
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
                ZStack{
                    ForEach(0..<self.slices.count){ i in
                        PieChartCell(rect: geometry.frame(in: .local), startDeg: self.slices[i].startDeg, endDeg: self.slices[i].endDeg, index: i, backgroundColor: self.backgroundColor, accentColor: self.accentColors[i])
//                            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: .infinity) {
//                                HapticFeedback.playSelection()
//                                self.chosenName = self.names[i]
//                            }
                            .gesture(LongPressGesture()
                                .onChanged({ _ in
                                    HapticFeedback.playSelection()
                                    self.chosenName = self.names[i]
                                })
                                .onEnded({ _ in
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                                        self.chosenName = ""
                                    }
                                })
                            )
                    }
                }
            }
        }
    }
}
