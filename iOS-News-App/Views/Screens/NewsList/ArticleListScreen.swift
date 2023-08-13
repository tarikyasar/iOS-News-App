//
//  ArticleListScreen.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import SwiftUI

struct ArticleListScreen: View {
    @StateObject var viewModel = ArticleListViewModel()
    
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
                        NavigationLink {
                            ArticleDetailScreen(article: article)
                        } label: {
                            ArticleView(article: article)
                                .padding(.bottom, 4)
                        }
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
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListScreen()
    }
}
