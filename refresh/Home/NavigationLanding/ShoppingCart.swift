//
//  ShoppingCart.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct ShoppingCart: View {
    @ObservedObject var fridgeItems = FridgeItems()
    var body: some View {
         Text("Shopping Cart")
        
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
