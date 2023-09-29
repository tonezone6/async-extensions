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
    VStack {
      if case .idle = model.downloadStatus {
        Button("Download 10MB") {
          Task {
            try await Task.sleep(seconds: 1)
            await model.download_10MB()
          }
        }
        .buttonStyle(.borderedProminent)
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
    .frame(width: 200)
  }
}

#Preview {
  ContentView()
}
