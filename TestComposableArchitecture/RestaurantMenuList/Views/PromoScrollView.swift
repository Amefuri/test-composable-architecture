//
//  PromoScrollView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct PromoScrollView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        PromoBadgeView(text: "ลด 15%", color: .green)
        PromoBadgeView(text: "ลด ฿30", color: .orange)
        PromoBadgeView(text: "ลด 10%", color: .blue)
      }
      .padding(.horizontal)
    }
  }
}
