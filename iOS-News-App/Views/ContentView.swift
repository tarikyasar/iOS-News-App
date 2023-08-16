//
//  ContentView.swift
//  iOS-News-App
//
//  Created by Tarik Yasar on 12.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ArticleListScreen()
        }
        .accentColor(Color.PrimaryColor)
        .background(Color.BackgroundColor)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
