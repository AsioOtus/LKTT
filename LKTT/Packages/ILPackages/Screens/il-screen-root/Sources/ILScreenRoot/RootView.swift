//
//  RootView.swift
//
//
//  Created by Anton on 28/07/2024.
//

import ILScreenFeed
import ILScreenPhotoDetails
import SwiftUI

public struct RootView: View {
	@State private var presentedPhotoUrl: URL?

	private var isPresentedPhotoUrlActive: Binding<Bool> {
		.init(
			get: {
				presentedPhotoUrl != nil
			},
			set: {
				if !$0 {
					presentedPhotoUrl = nil
				}
			}
		)
	}

	public init () { }

	public var body: some View {
		FeedView(presentedPhotoUrl: $presentedPhotoUrl)
			.ignoresSafeArea()
			.tint(.cyan)
			.sheet(isPresented: isPresentedPhotoUrlActive) {
				photoDetailsView()
			}
	}
}

private extension RootView {
	@ViewBuilder
	func photoDetailsView () -> some View {
		if let url = presentedPhotoUrl {
			PhotoDetailsView(url: url)
		}
	}
}
