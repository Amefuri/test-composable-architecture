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
                  MenuItemCard(item: item) {
                    viewStore.send(.addToCart(item))
                  }
                }
              }
              .padding(.horizontal)
            }
            
            // Menu List
            MenuListView()
        
            
            // Daily Offer
            //                    Text("ข้อเสนอวันนี้")
            //                        .font(.headline)
            //                        .padding(.horizontal)
            
            //                    DailyOfferView(item: viewStore.dailyOffer) {
            //                        viewStore.send(.addToCart(viewStore.dailyOffer))
            //                    }
            
            // Recommended
            //                    Text("สำหรับคุณ")
            //                        .font(.headline)
            //                        .padding(.horizontal)
            
            //                    ScrollView(.horizontal, showsIndicators: false) {
            //                        HStack(spacing: 16) {
            //                            ForEach(viewStore.recommended) { item in
            //                                RecommendedCard(item: item) {
            //                                    viewStore.send(.addToCart(item))
            //                                }
            //                            }
            //                        }
            //                        .padding(.horizontal)
            //                    }
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

struct PromoScrollView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        PromoBadge(text: "ลด 15%", color: .green)
        PromoBadge(text: "ลด ฿30", color: .orange)
        PromoBadge(text: "ลด 10%", color: .blue)
      }
      .padding(.horizontal)
    }
  }
}

struct PromoBadge: View {
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

struct MenuItemCard: View {
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


//struct DailyOfferView: View {
//    let item: MenuItem
//    let onAdd: () -> Void
//
//    var body: some View {
//        HStack {
//            Rectangle()
//                .fill(Color.red.opacity(0.2))
//                .frame(width: 80, height: 80)
//                .cornerRadius(8)
//
//            VStack(alignment: .leading) {
//                Text(item.name).font(.headline)
//                Text("อกไก่เนื้อล้วน ไม่ติดหนังผัดกะเพรา").font(.caption).foregroundColor(.secondary)
//                HStack {
//                    Text("฿\(item.price)").foregroundColor(.red)
//                    if let old = item.originalPrice {
//                        Text("฿\(old)").strikethrough().foregroundColor(.gray)
//                    }
//                }
//                .font(.footnote)
//            }
//
//            Spacer()
//
//            Button(action: onAdd) {
//                Image(systemName: "plus.circle.fill")
//                    .font(.title2)
//                    .foregroundColor(.green)
//            }
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct RecommendedCard: View {
//    let item: MenuItem
//    let onAdd: () -> Void
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 8) {
//            ZStack(alignment: .bottomTrailing) {
//                Rectangle()
//                    .fill(Color.yellow.opacity(0.3))
//                    .frame(width: 120, height: 120)
//                    .cornerRadius(10)
//
//                Button(action: onAdd) {
//                    Image(systemName: "plus.circle.fill")
//                        .font(.title2)
//                        .foregroundColor(.green)
//                }
//                .offset(x: -8, y: -8)
//            }
//
//            Text(item.name)
//                .font(.caption)
//                .padding(.horizontal, 4)
//                .lineLimit(2)
//        }
//        .frame(width: 120)
//    }
//}


