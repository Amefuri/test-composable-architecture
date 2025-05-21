//
//  ContentView.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 21/5/2568 BE.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Feature {
  
  @ObservableState
  struct State: Equatable {
    var count = 0
    var numberFact: String?
  }
  
  enum Action {
    case increment
    case decrement
  }
  
  var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case .increment:
        state.count += 1
        return .none
      case .decrement:
        state.count -= 1
        return .none
      }
    }
  }
}

struct ContentView: View {
  
  let store: StoreOf<Feature>
  
  var body: some View {
    NavigationView {
      List {
        Button("Increment") {
          store.send(.increment)
        }
      }
    }
  }
}

#Preview {
  let store = Store(initialState: .init(), reducer: {
    Feature()
  })
  ContentView(store: store)
}
