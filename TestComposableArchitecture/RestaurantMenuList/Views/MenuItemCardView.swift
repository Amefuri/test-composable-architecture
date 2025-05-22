//
//  MenuItemCardView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct MenuItemCardView: View {
  let item: MenuItem
  let onAdd: () -> Void
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      ZStack(alignment: .bottomTrailing) {
        Rectangle()
          .fill(Color.gray.opacity(0.3))
          .frame(width: 100, height: 100)
          .cornerRadius(8)
        
        Button(action: onAdd) {
          Image(systemName: "plus.circle.fill")
            .font(.title2)
            .foregroundColor(.green)
        }
        .offset(x: -6, y: -6)
      }
      
      Text(item.name)
        .font(.caption)
        .lineLimit(2)
      
      Text("฿\(item.price)")
        .font(.caption2)
        .foregroundColor(.secondary)
    }
    .frame(width: 100)
  }
}
