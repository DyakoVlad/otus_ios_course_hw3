//
//  ContentViewOverlay.swift
//  ViewModifiers
//
//  Created by exey on 19.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI

struct ContentViewOverlay: View {
    @State private var selection = 0
    
    @State private var endpoints = ["Pie", "Bar", "Line"]

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    AppState.shared.toggleOverlay()
                }, label: {
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.black)
                }).scaleEffect(2)
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
            Picker(selection: $selection, label: Text("3 source of charts")) {
                ForEach(0 ..< endpoints.count) { i in
                    Text(self.endpoints[i]).tag(i)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if self.selection == 0 {
                GithubRepoComparanceView()
                .environmentObject(GithubRepoComparanceViewModel())
            } else if self.selection == 1 {
                NewsTitleComparanceView()
                .environmentObject(NewsTitleComparanceViewModel())
            } else if self.selection == 2 {
                HistogramView()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color.white)
    }
}


struct ContentViewOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewOverlay()
    }
}
