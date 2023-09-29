//
//  ListChainViewModel.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI
import Combine
import metamask_ios_sdk

@Observable
class ListChainViewModel {
    private var cancellables: Set<AnyCancellable> = []
    private var dApp = Dapp(name: "AddChainToken", url: "")
    private var ethereum = MetaMaskSDK.shared.ethereum
    var chainTokens: [ERC20Acquisition]
    
    var walletAddress: String? = nil
    var errorMessage = ""
    var showError = false
    var showProgressView = false
    
    init(chainTokens: [ERC20Acquisition]) {
        self.chainTokens = chainTokens
    }
    
    func metaMaskConnect() {
        ethereum.connect(dApp)?.sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                self.showProgressView = false
                self.errorMessage = error.localizedDescription
                self.showError = true
                print("Connection error: \(self.errorMessage)")
            default: break
            }
        }, receiveValue: { result in
            self.showProgressView = false
            self.walletAddress = result as? String
            print("Connection result: \(result)")
        }).store(in: &cancellables)
    }

    func metaMaskAddToken(token: ERC20Acquisition) {
        let request = EthereumRequest(
            method: .watchAsset,
            params: token
        )
        
        ethereum.request(request)?.sink(receiveCompletion: { requestError in
            switch requestError {
            case .failure(let failure):
                self.showProgressView = false
                self.errorMessage = failure.localizedDescription
                self.showError = true
                print("WatchAsset error: \(self.errorMessage)")
            default: break
            }
        }, receiveValue: { result in
            self.showProgressView = false
            print("WatchAsset result: \(result)")
        })
        .store(in:  &cancellables)
    }
}
