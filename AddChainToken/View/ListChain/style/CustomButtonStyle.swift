//
//  CustomButtonStyle.swift
//  AddChainToken
//
//  Created by Claudio Cavalli on 29/09/23.
//

import SwiftUI

struct CustomButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10.0)
            .background(
                .blue
            )
            .cornerRadius(10.0)
    }
}
