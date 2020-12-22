//
//  homepage.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct homepage: View {
    
    var body: some View {
            VStack(){
                Image("refresh logo")
               
                TabView {
                    YourFridge()
                        .tabItem {
                            Image("fridge-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                            Text("Your Fridge")
                        }.padding(.trailing, UIScreen.main.bounds.width*0.05)
                    ShoppingCart()
                        .tabItem {
                            Image(systemName: "cart")
                            Text("ShoppingCart")
                        }
                    MembersPage()
                        .tabItem {
                            Text("MembersPage")
                            Image(systemName: "person.2")
                        }
                    ProfilePage()
                        .tabItem {
                            Text("ProfilePage")
                            Image(systemName: "person.crop.circle")
                                
                        }
                }.ignoresSafeArea()
                
                
            }

            }
}


