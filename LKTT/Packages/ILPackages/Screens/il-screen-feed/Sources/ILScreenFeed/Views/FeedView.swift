//
//  FeedView.swift
//
//
//  Created by Anton on 31/07/2024.
//

import SwiftUI

public struct FeedView: View {
	@Binding private var presentedPhotoUrl: URL?

	public init (presentedPhotoUrl: Binding<URL?>) {
		self._presentedPhotoUrl = presentedPhotoUrl
	}

	public var body: some View {
		NavigationView {
			FeedViewControllerRepresentable(presentedPhotoUrl: $presentedPhotoUrl)
				.navigationBarTitleDisplayMode(.inline)
				.navigationTitle("Curated photos")
				.ignoresSafeArea()
		}
	}
}
