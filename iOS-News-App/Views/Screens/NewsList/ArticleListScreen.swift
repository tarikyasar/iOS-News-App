//
//  ArticleListScreen.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import SwiftUI

struct ArticleListScreen: View {
    @StateObject var viewModel = ArticleListViewModel()
    @State var isSearchPresented = false
    
    var body: some View {
        VStack {
            if (isSearchPresented) {
                HStack {
                    TextField(text: $viewModel.searchText, label: {
                        Text("Enter a keyword")
                    })
                    
                    Button(action: {
                        viewModel.getNews(fromDate: getCurrentDate(), searchQuery: viewModel.searchText)
                    }, label: {
                        Text("Search")
                            .foregroundColor(Color.blue)
                            .bold()
                    })
                }
            }
            
            if (viewModel.isLoading) {
                ProgressView()
            } else if (viewModel.error != nil) {
                Text(viewModel.error?.localizedDescription ?? "An exception occured!")
            } else if (viewModel.news != nil) {
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
            if (viewModel.news == nil) {
                viewModel.getNews(fromDate: getCurrentDate(), searchQuery: viewModel.searchText)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isSearchPresented.toggle()
                    viewModel.clearSearchText()
                }, label: {
                    Image(systemName: isSearchPresented ? "xmark" : "magnifyingglass")
                        .animation(.easeOut, value: isSearchPresented)
                })
            }
        }
        .environmentObject(viewModel)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListScreen()
    }
}
