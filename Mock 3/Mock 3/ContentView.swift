//
//  ContentView.swift
//  Mock 3
//
//  Created by Akila Gamage on 2024-11-26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : ViewModel = ViewModel()
    var body: some View {
        TabView{
            GameView()
                .tabItem {
                    Label("Guess", systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }.tint(Color(viewModel.selectedColor))
    }
}

#Preview {
    ContentView()
}
