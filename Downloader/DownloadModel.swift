//
//  ContentModel.swift
//  AsyncStream
//
//  Created by Alex S. on 30/10/2022.
//

import AsyncExtensions
import Foundation

@MainActor
class DownloadModel: ObservableObject {
  @Published var downloadStatus: DownloadStatus = .idle
  
  func download_10MB() async {
    do {
      try await Task.sleep(seconds: 1)
      let url = URL(string: "http://ipv4.download.thinkbroadband.com/10MB.zip")!
      let (bytes, response) = try await URLSession.shared.bytes(from: url)
      let chunked = bytes.chunks(size: 1_050_000)
      let sequence = chunked.status(with: response.expectedContentLength)
      for try await status in sequence {
        self.downloadStatus = status // idle, progress(0.6), finished
      }
    } catch {
      print(error.localizedDescription)
    }
  }
}
