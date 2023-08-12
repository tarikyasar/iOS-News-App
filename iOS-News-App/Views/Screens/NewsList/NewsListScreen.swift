//
//  NewsListScreen.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import SwiftUI

struct NewsListScreen: View {
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some View {
        VStack {
            if (viewModel.isLoading) {
                ProgressView()
            } else if (viewModel.error != nil) {
                Text(viewModel.error?.localizedDescription ?? "An exception occured!")
            } else if (viewModel.news != nil) {
                HStack {
                    Text("News Count: \(viewModel.news?.totalResults ?? 0)")
                    
                    Spacer()
                    
                    Text("Date: \(getCurrentDate(format: "dd MMMM"))")
                }
                .padding(.bottom, 4)
                
                ScrollView {
                    ForEach(viewModel.news!.articles) { article in
                        ArticleView(article: article)
                            .padding(.bottom, 4)
                    }
                }
            }
        }
        .padding(12)
        .navigationTitle("News")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getNews(fromDate: getCurrentDate(), searchQuery: viewModel.searchText)
        }
        .environmentObject(viewModel)
    }
    
    private func getCurrentDate(format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date().addingTimeInterval((-1)*(24)*(60)*(60)))
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
