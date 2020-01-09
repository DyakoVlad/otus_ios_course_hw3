//
//  ContentView.swift
//  SegmentedControl
//
//  Created by exey on 19.12.2019.
//  Copyright © 2019 exey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                AppState.shared.toggleOverlay()
            }, label: {
                Text("Open new UIWindow")
            })
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
