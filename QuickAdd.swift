//
//  QuickAdd.swift
//  refresh
//
//  Created by Alice Zhang on 12/21/20.
//

import SwiftUI

struct QuickAdd: View {
    @State var isTapped = false
    @ObservedObject var recentItems = RecentItems()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var categories = ["Fruit", "Veggies", "Protein", "Grains", "Spices"]
    
    var foods = ["Beef", "Bread", "Potato"]
    @State var searchText: String = ""
     
    var body: some View {
        VStack{
            NavigationView {
                List {
                    TextField("Search", text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Text("Recent Items")
                        .font(.headline)
                        .padding(.top, 25)
                    ScrollView(.horizontal, content: {
                        HStack(spacing: UIScreen.main.bounds.width*0.05) {
                            ForEach(recentItems.items) { recentItem in
                                  VStack{
                                      Image(recentItem.pic)
                                        .resizable()
                                        .frame(width: 50,  height: 50)
                                      Text(recentItem.action)
                                      Spacer()
                                  }
                                  .padding()
                                  .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.width*0.25)
                                  .background(Color.boneWhite)
                                  .cornerRadius(10)
                                  .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            }
                        }
                        .padding(.leading, 10)
                        .padding(.bottom, 10)
                    })
                }
                .navigationBarTitle("Quick Add")
            }
            VStack{
                Text("Categories")
                    .font(.headline)
                    .padding(.top, 25)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: 40, alignment: .topLeading)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.15)
                        .background(Color.boneWhite)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                    }
                    .padding(.horizontal)
                }
            }
        }
        
//        HStack{
//            NavigationView {
//                List(recentItems.items) { recentItem in
//                  VStack{
//                      Image(recentItem.pic)
//                        .resizable()
//                        .frame(width: 50,  height: 50)
//                      Text(recentItem.action)
//                      Spacer()
//                  }
//                  .padding()
//                  .frame(width: UIScreen.main.bounds.width*0.2, height: UIScreen.main.bounds.width*0.2)
//                  .background(Color.boneWhite)
//                  .cornerRadius(10)
//                  .shadow(color: .gray, radius: 5, x: 5, y: 5)
//               }.navigationBarTitle(Text("Quick Add"))
//            }
//        }
        
        
        
//         NavigationView {
//             List {
//                 TextField("Search", text: $searchText)
//                     .padding(7)
//                     .background(Color(.systemGray6))
//                     .cornerRadius(8)
//
//                 ForEach(
//                     foods.filter {
//                         searchText.isEmpty ||
//                         $0.localizedStandardContains(searchText)
//                     },
//                     id: \.self
//                 ) { eachFood in
//                     Text(eachFood)
//                 }
//             }
//             .navigationBarTitle("Quick Add")
//         }
     
    }
}

struct QuickAdd_Previews: PreviewProvider {
    static var previews: some View {
        QuickAdd()
    }
}
