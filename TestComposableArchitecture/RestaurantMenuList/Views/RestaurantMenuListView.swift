//
//  RestaurantMenuListView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 21/5/2568 BE.
//

import SwiftUI
import ComposableArchitecture

#Preview {
  RestaurantMenuListView(
    store: Store(initialState: RestaurantMenuList.State(), reducer: {
      RestaurantMenuList()
    })
  )
}

struct RestaurantMenuListView: View {
  let store: StoreOf<RestaurantMenuList>
  
  var body: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      ZStack(alignment: .bottom) {
        // Main ScrollView
        ScrollView {
          VStack(alignment: .leading, spacing: 16) {
            
            // Restaurant Header (Static)
            RestaurantHeaderView()
            
            // Promotions (Static)
            PromoScrollView()
            
            // Recent Orders
            Text("คำสั่งซื้อล่าสุดของคุณ")
              .font(.headline)
              .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(alignment: .top, spacing: 16) {
                ForEach(viewStore.recentOrders) { item in
                  MenuItemCardView(item: item) {
                    viewStore.send(.addToCart(item))
                  }
                }
              }
              .padding(.horizontal)
            }
            
            // Menu List
            MenuListView()
          }
          .padding(.top)
        }
        
        CartSheetView()
          .frame(maxHeight: .infinity, alignment: .bottom)
          .ignoresSafeArea(edges: .bottom)
      }
    }
  }
}











