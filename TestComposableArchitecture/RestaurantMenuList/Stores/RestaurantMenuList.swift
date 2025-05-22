//
//  RestaurantMenuList.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 21/5/2568 BE.
//

import ComposableArchitecture
import Foundation

@Reducer
struct RestaurantMenuList {
  struct State: Equatable {
    var recentOrders: [MenuItem] = [
      .init(id: UUID(), name: "#ขายดี#ข้าวผัดปากน้ำโพ", price: 69, description: "description"),
      .init(id: UUID(), name: "มาม่าผัดแห้ง", price: 75, description: "description")
    ]
    var dailyOffer: MenuItem = .init(id: UUID(), name: "กะเพราไก่-ราดข้าว", price: 62, originalPrice: 69, description: "description")
    var recommended: [MenuItem] = [
      .init(id: UUID(), name: "ข้าวผัด", price: 69, description: "description"),
      .init(id: UUID(), name: "ไก่ผัดเผ็ด", price: 79, description: "description")
    ]
  }
  
  enum Action: Equatable {
    case addToCart(MenuItem)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addToCart(let item):
        print("🛒 Add to cart: \(item.name)")
        return .none
      }
    }
  }
}
