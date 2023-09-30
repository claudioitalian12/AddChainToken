//
//  TokenCardView.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI

struct TokenCardView: View {
    let tokenModel: ERC20Acquisition
    let action: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 10) {
                imageOptions
                tokenOptions
            }
            Spacer()
            buttonOptions
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.vertical, 10)
    }
    
    private var imageOptions: some View {
        AsyncImage(url: URL(string: tokenModel.options.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Color.gray
        }
        .frame(width: 25, height: 25)
    }
    
    private var tokenOptions: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Address: \(tokenModel.options.address)")
                .foregroundStyle(.black)
                .font(.headline)

            Text("Symbol: \(tokenModel.options.symbol)")
                .foregroundStyle(.black)
                .font(.subheadline)

            Text("Decimals: \(tokenModel.options.decimals)")
                .foregroundStyle(.black)
                .font(.subheadline)
        }
    }
    
    private var buttonOptions: some View {
        Button(
            action: action,
            label: {
                Text("Add Token")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .modifier(CustomButtonStyle())
            }
        )
    }
}

#Preview {
    TokenCardView(
        tokenModel: Tokens.first ?? .init(
            type: "",
            options: Options(
                address: "",
                symbol: "",
                image: "",
                decimals: 18
            )
        ),
        action: {}
    )
}
