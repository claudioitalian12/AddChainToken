//
//  AddChainTokenApp.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI

@main
struct AddChainTokenApp: App {
    var body: some Scene {
        WindowGroup {
            ListChainView(
                viewModel: ListChainViewModel(
                    chainTokens: Tokens
                )
            )
        }
    }
}
