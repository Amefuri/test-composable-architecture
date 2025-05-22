//
//  PromoBadgeView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct PromoBadgeView: View {
  let text: String
  let color: Color
  
  var body: some View {
    Text(text)
      .padding(.horizontal, 12)
      .padding(.vertical, 6)
      .background(color.opacity(0.15))
      .foregroundColor(color)
      .cornerRadius(12)
      .font(.caption)
  }
}
