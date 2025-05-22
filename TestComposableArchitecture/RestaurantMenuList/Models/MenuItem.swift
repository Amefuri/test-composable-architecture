//
//  MenuItem.swift
//  TestComposableArchitecture
//
//  Created by peerapat atawatana on 22/5/2568 BE.
//

import Foundation

struct MenuItem: Equatable, Identifiable {
  let id: UUID
  let name: String
  let price: Int
  var originalPrice: Int?
  let description: String
}
