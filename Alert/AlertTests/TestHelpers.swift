//
//  TestHelpers.swift
//  AlertTests
//
//  Created by Carlos Paredes on 21/3/23.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

///Func to test UIBarButtonItem
func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}
