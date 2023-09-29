//
//  TokenCardViewStyle.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI

struct TokenCardViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.white)
            .cornerRadius(10.0)
            .background {
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 1.0)
                    .foregroundStyle(.black)
            }
            .padding(10.0)
    }
}
