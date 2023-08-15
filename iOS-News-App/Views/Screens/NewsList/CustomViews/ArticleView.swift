//
//  NewView.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import SwiftUI

struct ArticleView: View {
    @State var article: Article
    
    var body: some View {
        VStack {
            if (article.urlToImage != nil) {
                AsyncImage(
                    url: URL(string: article.urlToImage!),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
            
            Text(article.title)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20.0).bold())
                .padding(.bottom, 12)
                .foregroundColor(Color.black)
            
            Text(article.description)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16.0).bold())
                .padding(.bottom, 32)
                .foregroundColor(Color.black)
            
            HStack {
                Text(article.author ?? article.source.name)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Text(formatDate(date: getDateFromString(date: article.publishedAt)!))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.trailing)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.SurfaceColor)
        .cornerRadius(8)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.sampleArticleData)
    }
}
