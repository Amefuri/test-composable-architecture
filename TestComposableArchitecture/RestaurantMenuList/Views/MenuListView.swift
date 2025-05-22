//
//  MenuListView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import SwiftUI

struct MenuListView: View {
  let header1 = "ข้าวผัด 🍤🐷🐔🦀"
  
  let items1: [MenuItem] = [
    .init(id: UUID(), name: "ข้าวผัดกุ้ง", price: 99, description: "ข้าวผัดกุ้งใส่ไข่,ใส่แครอท,ต้นหอมซอย"),
    .init(id: UUID(), name: "ข้าวผัดรวมมิตร", price: 99, description: "หมู,หมึก,กุ้ง,ไก่ ผัดใส่ไข่,แครอท,ต้นหอม..."),
    .init(id: UUID(), name: "ข้าวผัดต้มยำ", price: 89, description: "ข้าวผัดต้มยำใส่เนื้อไก่ เปลี่ยนเป็นเนื้อสัตว์อื่นๆได้"),
    .init(id: UUID(), name: "#ขายดี#ข้าวผัดปากน้ำโพ", price: 69, description: "ข้าวผัดโบราณ ใส่ละน้า มะเขือเทศ หอมใหญ่..."),
    .init(id: UUID(), name: "#ขายดี#ข้าวผัดหมู", price: 69, description: "ใส่หมู,แครอท,ต้นหอม")
  ]
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        ForEach(items1, id: \.id) { item in
          MenuRowView(item: item) {
            // handle add to cart
          }
        }
      }
      .padding()
    }
  }
}
