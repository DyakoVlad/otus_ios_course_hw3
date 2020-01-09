//
//  BarChart.swift
//  SegmentedControl
//
//  Created by Vladislav Dyakov on 08.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI
import NewsAPI

class NewsTitleComparanceViewModel: ObservableObject {
    @Published private(set) var titles: [String] = ["nginx", "Apple", "bitcoin"]
    @Published private(set) var names: [String] = []
    @Published private(set) var data: [Double] = []
    
    init() {
        getDataFromGithub()
    }
    
    func getDataFromGithub() {
        for title in titles {
            ArticlesAPI.everythingGet(q: title, from: "", sortBy: "publishedAt", apiKey: "07d9218cd39644048e7729166c03eb3c") { data, error in
                self.names.append(title)
                self.data.append(Double(data?.totalResults ?? 0))
            }
        }
    }
}

struct NewsTitleComparanceView: View {
    @EnvironmentObject var viewModel: NewsTitleComparanceViewModel
    
    var body: some View {
        VStack {
            if viewModel.titles.count == viewModel.data.count {
                BarChartView(data: viewModel.data, names: viewModel.names, title: "Comparison of news titles", legend: "Bar Chart")
            } else {
                Spacer()
                HStack {
                    ActivityIndicator()
                    Text("Loading")
                    .font(.system(.headline))
                }
                Spacer()
            }
        }
    }
}
