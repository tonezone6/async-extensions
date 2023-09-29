# Async extensions

A collection of Swift concurrency extensions.

### Async sequences: chunks, download status

```swift
do {
  let url = URL(string: "https://download.com/10MB.zip")!
  let (bytes, response) = try await URLSession.shared.bytes(from: url)
  let chunked = bytes.chunks(size: 1_000_000)
  let sequence = chunked.status(with: response.expectedContentLength)
  for try await status in sequence {
    downloadStatus = status // idle, progress, finished
  }
} catch {
  // error handling
} 
```

![Screenshot](simulator.gif)
