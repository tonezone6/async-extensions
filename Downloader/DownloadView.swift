//
//  ContentView.swift
//  SwiftConcurrency
//
//  Created by Alex S. on 15/11/2022.
//

import SwiftUI

struct ContentView: View {
  @StateObject var model = DownloadModel()
  
  var body: some View {
    ZStack {
      Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
      VStack {
        if case .idle = model.downloadStatus {
          Text("Preparing...")
        }
        
        if case let .progress(value) = model.downloadStatus {
          VStack {
            Text(value.formatted(.percent.notation(.compactName)))
              .fontWeight(.medium)
            ProgressView(value: value)
          }
        }
        
        if case .finished = model.downloadStatus {
          HStack {
            Text("Download finished")
            Image(systemName: "checkmark.circle")
              .fontWeight(.semibold)
              .foregroundColor(.accentColor)
          }
        }
      }
      .frame(width: 200, height: 40)
      .padding()
      .background(.white)
      .cornerRadius(10)
      .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(.gray.opacity(0.2), lineWidth: 2)
      )
    }
    .task {
      await model.download_10MB()
    }
  }
}

#Preview {
  ContentView()
}
