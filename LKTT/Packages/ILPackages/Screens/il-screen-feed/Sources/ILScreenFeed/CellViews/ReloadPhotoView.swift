//
//  ReloadPhotoView.swift
//
//
//  Created by Anton on 31/07/2024.
//

import UIKit
import UIKitExtensions

final class ReloadPhotoView: UIView, XibInstantiatable {
	@IBOutlet private var messageLabel: UILabel!

	var onReload: (() -> Void)?

	override func awakeFromNib () {
		super.awakeFromNib()

		layer.cornerRadius = 15

		messageLabel.text = "Failed to load image"
	}

	@IBAction func onReloadButtonTap() {
		onReload?()
	}
}
