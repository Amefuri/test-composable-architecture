//
//  RestaurantHeaderView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct RestaurantHeaderView: View {
  var body: some View {
    HStack {
      Image(systemName: "leaf.circle.fill")
        .resizable()
        .frame(width: 60, height: 60)
        .foregroundColor(.green)
      
      VStack(alignment: .leading) {
        Text("อรุณีข้าวผัดปู").font(.headline)
        Text("เจริญราษฎร์ (ซอยอยู่ดี 4)").font(.subheadline).foregroundColor(.secondary)
        Text("⭐ 4.8 (3พัน+) · ฟรี ฿2 · 25 นาที ขึ้นไป")
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
      Spacer()
    }
    .padding(.horizontal)
  }
}
