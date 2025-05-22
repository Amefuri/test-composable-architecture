//
//  CartSheetView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct CartSheetView: View {
  var body: some View {
    VStack {
      Button(action: {
        // handle checkout
      }) {
        Text("ตะกร้า : 1 รายการ")
          .font(.headline)
          .foregroundColor(.white)
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.green)
          .cornerRadius(8)
      }
    }
    .padding(.horizontal)
    .padding(.vertical)
    .padding(.bottom, 24)
    .background(
      RoundedRectangle(cornerRadius: 24)
        .fill(Color(.systemBackground))
        .shadow(radius: 12)
    )
  }
}
