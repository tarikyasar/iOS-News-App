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
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20.0).bold())
                .padding(.bottom, 12)
            
            Text(article.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16.0).bold())
                .padding(.bottom, 32)
            
            HStack {
                Text(article.author ?? article.source.name)
                
                Spacer()
                
                Text(formatDate(date: getDateFromString(date: article.publishedAt)!))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.SurfaceColor)
        .cornerRadius(8)
    }
    
    private func getDateFromString(date: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter.date(from: date)
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: date)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.sampleArticleResponse)
    }
}
