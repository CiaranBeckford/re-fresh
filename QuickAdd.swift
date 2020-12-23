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
    @Binding var fridgeList : [Item]    
    @State private var selection: String? = nil
    @State var chosenCategory : String = ""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var categories = ["Fruit", "Veggies", "Protein", "Grains", "Spices"]
    
    var foods = ["Beef", "Bread", "Potato"]
    @State var searchText: String = ""
     
    var body: some View {
        VStack{
                HStack {
                    NavigationLink(destination: YourFridge(fridgeItems: self.fridgeList)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true), tag: "homepage", selection: $selection) {  }
                    
                    Button(action: {
                        self.fridgeList.append(Item(action: "Apple", pic: "apple", expiration: 4.0, account: "profile1"))
                        self.selection = "homepage"
                    }) {
                        Image("apple")
                            .padding()
                            .background(Color.boneWhite)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .frame(width: 75, height: 75)
                    }.padding()
                    
                    
                    Button(action: {
                        self.fridgeList.append(Item(action: "Carrot", pic: "carrot", expiration: 10.0, account: "profile1"))
                        self.selection = "homepage"
                    }){
                        Image("carrot")
                            .padding()
                            .background(Color.boneWhite)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .frame(width: 75, height: 75)
                    }.padding()
                    
                    
                    Button(action: {
                        self.fridgeList.append(Item(action: "Eggplant", pic: "eggplant", expiration: 12.0, account: "profile1"))
                        self.selection = "homepage"
                    }) {
                        Image("eggplant")
                            .padding()
                            .background(Color.boneWhite)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            .frame(width: 75, height: 75)
                    }.padding()
                }
            Divider()
            
            VStack{
                NavigationLink(destination: Categories(categoryF: self.chosenCategory, fridgeList: self.$fridgeList)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), tag: "itemCategory", selection: $selection) {  }
                Text("Categories")
                    .font(.headline)
                    .padding(.vertical, 25)
                    .frame(width: UIScreen.main.bounds.width*0.9, height: 40, alignment: .topLeading)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            
                            Button (action: {
                                self.chosenCategory = category
                                self.selection = "itemCategory"
                                
                            }){
                                
                                
                                HStack{
                                    Text(category)
                                        .font(.custom("Helvetica Neue", size: 14))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.init(0x3F414E))
                                }.padding()
                                .frame(width: UIScreen.main.bounds.width*0.4, height: UIScreen.main.bounds.width*0.15)
                                .background(Color.boneWhite)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
        
    }
}

struct Categories : View {
    var categoryF : String
    
    @Binding var fridgeList : [Item]
    @State private var selection: String? = nil
    @ObservedObject var qaCategories = ItemCategory()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            //ScrollView {
            
                HStack {
                    ForEach(qaCategories.itemCategory) { category in
                        Button (action: {
                            
                        }){
                            NavigationLink(destination: YourFridge(fridgeItems: self.fridgeList)
                                            .navigationBarTitle("")
                                            .navigationBarHidden(true)
                                            .navigationBarBackButtonHidden(true), tag: "homepage", selection: $selection) {  }
                            
                            Button(action: {
                                self.fridgeList.append(Item(action: category.name.capitalized, pic: category.name, expiration: 4.0, account: "profile1"))
                                self.selection = "homepage"
                                
                            }) {
                                if categoryF.elementsEqual(category.category) {
                                   
                                    Image(category.name)
                                        .padding()
                                        .background(Color.boneWhite)
                                        .cornerRadius(10)
                                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                                        .frame(width: 75, height: 75)
                                        .padding()
                                }
                                
                            }
                        }
                    }
                }
                  
                .padding(.horizontal)
            //}
        }
        
    }
}
