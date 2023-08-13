//
//  ArticleDetailScreen.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 13.08.2023.
//

import SwiftUI

struct ArticleDetailScreen: View {
    let article: Article
    
    var body: some View {
        VStack {
            ScrollView {
                if (article.urlToImage != nil) {
                    AsyncImage(
                        url: URL(string: article.urlToImage!),
                        content: { image in
                            ZStack {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Text(article.author ?? article.source.name)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                        Text(formatDate(date: getDateFromString(date: article.publishedAt)!))
                                            .foregroundColor(Color.white)
                                    }
                                    .padding(4)
                                    .background(Color(uiColor: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)))
                                }
                            }
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
                
                Text(article.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20.0).bold())
                    .padding(.bottom, 12)
                
                Text(article.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 16.0).bold())
                    .padding(.bottom, 32)
                
                Spacer()
            }
        }
        .padding(8)
    }
}

struct ArticleDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailScreen(article: Article.sampleArticleResponse)
    }
}
