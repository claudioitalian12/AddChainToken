//
//  ListChainView.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI

struct ListChainView: View {
    @State var viewModel: ListChainViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            header
            Spacer(minLength: 20.0)
            cards
        }
        .padding()
        .overlay {
            if viewModel.showProgressView {
                Color(.black.withAlphaComponent(0.3))
                    .overlay {
                        ProgressView()
                            .scaleEffect(1.5, anchor: .center)
                            .progressViewStyle(.circular)
                    }
                    .ignoresSafeArea()
            } else {
                EmptyView()
            }
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage)
            )
        }
    }
    
    private var header: some View {
        VStack(spacing: 20.0) {
            Text("List Chain View")
                .font(.title)
            VStack(spacing: 30.0) {
                VStack {
                    Text("walletAddress: \(viewModel.walletAddress ?? "")")
                    Button(action: {
                        viewModel.showProgressView = true
                        viewModel.metaMaskConnect()
                    }, label: {
                        Text("Connect to Wallet")
                            .foregroundStyle(.white)
                            .modifier(CustomButtonStyle())
                    })
                }
            }
        }
    }
    
    private var cards: some View {
        VStack(spacing: 20.0) {
            ForEach(viewModel.chainTokens, id: \.id) { token in
                TokenCardView(
                    tokenModel: token,
                    action: {
                        viewModel.showProgressView = true
                        viewModel.metaMaskAddToken(token: token)
                    }
                )
                .modifier(TokenCardViewStyle())
            }
        }
    }
}

#Preview {
    ListChainView(
        viewModel: ListChainViewModel(
            chainTokens: Tokens
        )
    )
}
