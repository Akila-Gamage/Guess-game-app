//
//  SettingsView.swift
//  Mock 3
//
//  Created by Akila Gamage on 2024-11-26.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel : ViewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Settings")
                    .font(.system(size: 25, weight: .bold))
                Text("Font size: (\(viewModel.fontSize, specifier: "%.2f"))px")
                Slider(
                    value: $viewModel.fontSize,
                    in: 10...24
                )
                HStack {
                    Text("System Color")
                    Picker("", selection: $viewModel.selectedColor) {
                        ForEach(FontColor.allCases, id:\.self) { color in
                            Text(color.rawValue).tag(color.rawValue)
                        }
                    }.pickerStyle(.wheel)
                    Color(viewModel.selectedColor)
                        .frame(width: 30,height: 30)
                }
                Spacer()
            }.padding()
        }.padding()
    }
}

//#Preview {
//    SettingsView()
//}
