//
//  PieChart.swift
//  SegmentedControl
//
//  Created by Vladislav Dyakov on 08.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import SwiftUI
import GitHubAPI

class GithubRepoComparanceViewModel: ObservableObject {
    @Published private(set) var languages: [String] = ["Swift", "Kotlin", "JavaScript"]
    @Published private(set) var names: [String] = []
    @Published private(set) var data: [Double] = []
    
    init() {
        getDataFromGithub()
    }
    
    func getDataFromGithub() {
        for lang in languages {
            SearchAPI.searchReposGet(q: lang, order: .asc, completion: { data, error in
                self.names.append(lang)
                self.data.append(Double(data?.totalCount ?? 0))
            })
        }
    }
}

struct GithubRepoComparanceView: View {
    @EnvironmentObject var viewModel: GithubRepoComparanceViewModel
    
    var body: some View {
        VStack {
            if viewModel.languages.count == viewModel.data.count {
                PieChartView(data: viewModel.data, names: viewModel.names, title: "Comparison of popular programming languages", legend: "Pie Chart")
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
