//
//  ShoppingCart.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct ShoppingCart: View {
    @ObservedObject var cartItems = CartItems()
    
    var body: some View {
        
        VStack{
            NavigationView {
                List(cartItems.items) { cartItem in
                  HStack{
                      Image(cartItem.pic)
                      VStack{
                          HStack{
                              Text(cartItem.action)
                              Spacer()
                          }
                      }

                      Spacer()
                  }
                  .padding()
                  .frame(width: UIScreen.main.bounds.width*0.85, height: 60)
                  .background(Color.boneWhite)
                  .cornerRadius(10)
                  .shadow(color: .gray, radius: 5, x: 5, y: 5)
               }.navigationBarTitle(Text("Shopping Cart"))
            }
            Button(action: {
                // Example of how to append item: self.fridgeItems.items.append(Item(action: "Potato", pic: "potato", expiration: 60.0, account: "profile2"))
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 65, height:65)
                    .foregroundColor(Color.teal)
                    .padding()
            }
            
            
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
