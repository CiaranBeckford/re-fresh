//
//  YourFridge.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI



struct YourFridge: View {
    @State var isTapped = false

    @State var progressValue: Float = 0.0
    @ObservedObject var fridgeItems = FridgeItems()
    
    //TODO: https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-a-swiftui-list
    
       var body: some View {
        VStack{
            NavigationView {
                List(fridgeItems.items) { fridgeItem in
                NavigationLink(destination: ItemView(fridgeItem: fridgeItem), isActive: Binding<Bool>(get: { isTapped }, set: { isTapped = $0; })) {
                      HStack{
                          Image(fridgeItem.pic)
                          VStack{
                              HStack{
                                  Text(fridgeItem.action)
                                  Spacer()
                              }
                            HStack{
                                ProgressBar(value: 1.0-1.0/fridgeItem.expiration).frame(height: 15)
                                Spacer()
                                Image(fridgeItem.account)
                                    .resizable()
                                    .frame(width: 20,  height: 20)
                            }
                              
                          }
                          
                          Spacer()
                      }
                      .padding()
                      .frame(width: UIScreen.main.bounds.width*0.85, height: 60)
                      .background(Color.boneWhite)
                      .cornerRadius(10)
                      .shadow(color: .gray, radius: 5, x: 5, y: 5)
                     
                  }
               }.navigationBarTitle(Text("Your Items"))
            }
            if !self.isTapped {
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
}

struct YourFridge_Previews: PreviewProvider {
    static var previews: some View {
        YourFridge()
    }
}
struct ItemView: View {
   var fridgeItem: Item
   var body: some View {
    VStack{
        Text("Edit Item Details")
        HStack{
            Text(fridgeItem.action)
            Image(fridgeItem.pic)
        }
    }
    
      
   }
}

struct ProgressBar: View {
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}