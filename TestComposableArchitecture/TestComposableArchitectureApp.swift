//
//  TestComposableArchitectureApp.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 21/5/2568 BE.
//

import SwiftUI
import ComposableArchitecture

@main
struct TestComposableArchitectureApp: App {
    var body: some Scene {
        WindowGroup {
//          let store = Store(initialState: .init(), reducer: {
//            Feature()
//          })
//          ContentView(store: store)
          
          RestaurantMenuListView(
            store: Store(initialState: .init(), reducer: {
              RestaurantMenuList()
            })
          )
        }
    }
}
