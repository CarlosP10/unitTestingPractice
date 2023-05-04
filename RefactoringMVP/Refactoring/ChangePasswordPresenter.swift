//
//  ChangePasswordPresenter.swift
//  Refactoring
//
//  Created by Carlos Paredes on 4/5/23.
//

import Foundation

class ChangePasswordPresenter {
    private unowned var view: ChangePasswordViewCommands!
    private var viewModel: ChangePasswordViewModel
        
    init(view: ChangePasswordViewCommands,
         viewModel: ChangePasswordViewModel) {
        self.view = view
        self.viewModel = viewModel
    }
    
    func handleSuccess() {
        view.hideActivityIndicator()
        view.showAlert(message: viewModel.successMessage) { [weak self] in
            self?.view.dismissModal()
        }
    }
}
