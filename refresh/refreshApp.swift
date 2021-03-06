//
//  refreshApp.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//  Edited by Alice Zhang on 12/21/20.
//

import SwiftUI

@main
struct refreshApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            //Checks if user has made a fridge
            
            if UserDefaults.standard.string(forKey: "fridgeName") != nil {
                homepage()
            }
            else {
                TitleScreen()
            }
 
            //QRCodeScannerExampleView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.teal)
        return true
    }
}

struct Item: Identifiable {
   var id = UUID()
   var action: String
   var pic : String
   var expiration : Float
   var account : String
}
class FridgeItems: ObservableObject {
  @Published  var items: [Item] = [Item(action: "Apple", pic: "apple", expiration: 4.0, account: "profile1")]
    /*
      Item(action: "Potato", pic: "potato", expiration: 60.0, account: "profile1"),
      Item(action: "Steak", pic: "steak", expiration: 4.0, account: "profile2"),
      Item(action: "Egg", pic: "egg", expiration: 12.0, account: "profile1"),
      Item(action: "Mayo", pic: "mayo", expiration: 60.0, account: "profile1"),
      Item(action: "Apple", pic: "apple", expiration: 4.0, account: "profile1"),
      Item(action: "Carrot", pic: "carrot", expiration: 20.0, account: "profile2"),
      Item(action: "Bread", pic: "bread", expiration: 7.0, account: "profile2"),
      Item(action: "Green Sauce", pic: "greensauce", expiration: 45.0, account: "profile1")*/
}
class CartItems: ObservableObject {
  @Published  var items: [Item] = [
    Item(action: "Potato", pic: "potato", expiration: 60.0, account: "profile1"),
    Item(action: "Egg", pic: "egg", expiration: 12.0, account: "profile1"),
    Item(action: "Mayo", pic: "mayo", expiration: 60.0, account: "profile1"),
    Item(action: "Apple", pic: "apple", expiration: 4.0, account: "profile1")
   ]
}
class RecentItems: ObservableObject {
  @Published  var items: [Item] = [
    Item(action: "Potato", pic: "potato", expiration: 60.0, account: "profile1"),
    Item(action: "Steak", pic: "steak", expiration: 4.0, account: "profile2"),
    Item(action: "Egg", pic: "egg", expiration: 12.0, account: "profile1"),
    Item(action: "Mayo", pic: "mayo", expiration: 60.0, account: "profile1"),
    Item(action: "Apple", pic: "apple", expiration: 4.0, account: "profile1"),
    Item(action: "Carrot", pic: "carrot", expiration: 20.0, account: "profile2"),
    Item(action: "Bread", pic: "bread", expiration: 7.0, account: "profile2"),
    Item(action: "Green Sauce", pic: "greensauce", expiration: 45.0, account: "profile1")
   ]
}

struct Member: Identifiable {
   var id = UUID()
   var action: String
   var pic : String
   var account : String
}
class FridgeMembers: ObservableObject {
  @Published  var members: [Member] = [
    Member(action: "Person 1", pic: "profile1", account: "profile1"),
    Member(action: "Person 2", pic: "profile2", account: "profile2")
   ]
}

class ItemCategory : ObservableObject {
    @Published var itemCategory : [ItemC] = [ItemC(name: "apple", category: "Fruit"),
                                             ItemC(name: "carrot", category: "Veggies"),                                             
                                             ItemC(name: "potato", category: "Veggies"),
                                             ItemC(name: "egg", category: "Protein"),
                                             ItemC(name: "steak", category: "Protein"),
                                             ItemC(name: "bread", category: "Grains"),
                                             ItemC(name: "greensauce", category: "Spices"),
    ]
}
struct ItemC: Identifiable {
   var id = UUID()
   var name : String
   var category : String
}
