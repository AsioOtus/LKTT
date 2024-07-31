//
//  FeedFooterInfoView.swift
//  
//
//  Created by Anton on 30/07/2024.
//

import UIKit
import UIKitExtensions

final class FeedFooterInfoView: UICollectionReusableView, XibInstantiatable {
	static var reuseIdentifier: String { Self.self.description() }

	var message: String = "" {
		didSet {
			messageLabel.text = message
		}
	}

	@IBOutlet private var messageLabel: UILabel!
}
