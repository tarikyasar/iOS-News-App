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
    @State var tag: String? = nil
    
    var body: some View {
        VStack {
            if (isSearchPresented) {
                HStack {
                    TextField(text: $viewModel.searchText, label: {
                        Text("Enter a keyword")
                    })
                    .transition(.slide)
                    
                    Button(action: {
                        if (viewModel.searchText != "") {
                            viewModel.getNews(fromDate: getCurrentDate(), searchQuery: viewModel.searchText)
                            
                            tag = viewModel.searchText
                            isSearchPresented.toggle()
                        }
                    }, label: {
                        Text("Search")
                            .foregroundColor(viewModel.searchText == "" ? Color.SurfaceColor : Color.PrimaryColor)
                            .bold()
                    })
                }
            }
            
            if (viewModel.isLoading) {
                ProgressView()
            } else if (viewModel.error != nil) {
                Text(viewModel.error?.localizedDescription ?? "An exception occured!")
            } else if (viewModel.articles != nil) {
                ScrollView {
                    ForEach(viewModel.articles!) { article in
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
        .onAppear {
            if (viewModel.articles == nil) {
                viewModel.getNews(fromDate: getCurrentDate(), searchQuery: viewModel.searchText)
                
                tag = viewModel.searchText
            }
        }
        .toolbar {
            if (tag != nil) {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("#\(tag!)")
                        .foregroundColor(Color.PrimaryColor)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isSearchPresented.toggle()
                    viewModel.clearSearchText()
                }, label: {
                    Image(systemName: isSearchPresented ? "xmark" : "magnifyingglass")
                        .transition(.opacity)
                })
            }
            
        }
        .toolbarBackground(Color.BackgroundColor.opacity(0.4))
        .toolbarColorScheme(.dark)
        .background(Color.BackgroundColor)
        .environmentObject(viewModel)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListScreen()
    }
}
