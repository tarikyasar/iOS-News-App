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
            NewsListScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}