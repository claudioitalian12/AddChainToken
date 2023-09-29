//
//  Tokens.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import Foundation

let Tokens = [
    ERC20Acquisition(
        type: "ERC20",
        options: Options(
            address: "0xdAC17F958D2ee523a2206206994597C13D831EC7",
            symbol: "USDT",
            image: "https://etherscan.io/token/images/tethernew_32.png",
            decimals: 18
        )
    ),
    ERC20Acquisition(
        type: "ERC20",
        options: Options(
            address: "0xA0b86991c6218b36c1d19D4a2e9Eb0c55176190D",
            symbol: "USDC",
            image: "https://etherscan.io/token/images/centre-usdc_28.png",
            decimals: 18
        )
    ),
    ERC20Acquisition(
        type: "ERC20",
        options: Options(
            address: "0x9f8f72aa9304c8b59069c60b2746e587e5a2c3a3",
            symbol: "MANA",
            image: "https://etherscan.io/token/images/decentraland_32.png?v=1",
            decimals: 18
        )
    ),
    ERC20Acquisition(
        type: "ERC20",
        options: Options(
            address: "0x76537fd5751401b3f949f67f3f91327f9c59a0a5",
            symbol: "AAVE",
            image: "https://etherscan.io/token/images/aave_32.png",
            decimals: 18
        )
    ),
    ERC20Acquisition(
        type: "ERC20",
        options: Options(
            address: "0x7fc66500c84aaf64a715127bc947e79c9624bf7f",
            symbol: "UNI",
            image: "https://etherscan.io/token/images/uniswap_32.png",
            decimals: 18
        )
    )
]
