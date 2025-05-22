//
//  MenuRowView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct MenuRowView: View {
  let item: MenuItem
  let onAdd: () -> Void
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      HStack(alignment: .center, spacing: 12) {
        Rectangle()
          .fill(Color.gray.opacity(0.2))
          .frame(width: 70, height: 70)
          .cornerRadius(8)
        
        VStack(alignment: .leading, spacing: 4) {
          Text(item.name)
            .font(.headline)
          
          Text(item.description)
            .font(.caption)
            .foregroundColor(.secondary)
          
          Text("฿\(item.price)")
            .font(.subheadline)
            .fontWeight(.bold)
        }
        
        Spacer()
        
        
      }
      Button(action: onAdd) {
        Image(systemName: "plus.circle.fill")
          .font(.title2)
          .foregroundColor(.green)
      }
    }
    
  }
}
