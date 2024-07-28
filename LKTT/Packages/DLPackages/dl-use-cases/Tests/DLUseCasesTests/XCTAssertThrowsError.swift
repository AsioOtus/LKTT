//
//  XCTAssertThrowsError.swift
//
//
//  Created by Anton on 28/07/2024.
//

import XCTest

public func XCTAssertThrowsError <T> (_ expression: @autoclosure () async throws -> T, errorHandler: (Error) -> Void) async {
	do {
		_ = try await expression()
		XCTFail("No error was thrown.")
	} catch {
		errorHandler(error)
	}
}

