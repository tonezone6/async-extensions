//
//  Task-Sleep.swift
//  AsyncStream
//
//  Created by Alex S. on 30/10/2022.
//

import Foundation

extension Task where Success == Never, Failure == Never {
  public static func sleep(seconds: Double) async throws {
    let nanoseconds = UInt64(seconds * 1_000_000_000)
    try await sleep(nanoseconds: nanoseconds)
  }
}
