//
//  ERC20.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import Foundation
import metamask_ios_sdk

// MARK: - ERC20Acquisition
struct ERC20Acquisition: CodableData, Identifiable {
    var id: UUID = UUID()
    
    let type: String
    let options: Options
    
    init(type: String, options: Options) {
        self.type = type
        self.options = options
    }
    
    func socketRepresentation() -> NetworkData {
        [
            "type": type,
            "options": options
        ]
    }
}

// MARK: - Options
struct Options: CodableData, Identifiable {
    var id: UUID = UUID()

    let address, symbol, image: String
    let decimals: Int

    init(address: String, symbol: String, image: String, decimals: Int) {
        self.address = address
        self.symbol = symbol
        self.image = image
        self.decimals = decimals
    }
    
    func socketRepresentation() -> NetworkData {
        [
            "address": address,
            "symbol": symbol,
            "image": image,
            "decimals": decimals
        ]
    }
}
