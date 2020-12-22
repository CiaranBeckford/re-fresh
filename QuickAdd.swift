//
//  QuickAdd.swift
//  refresh
//
//  Created by Alice Zhang on 12/21/20.
//

import SwiftUI

struct QuickAdd: View {
    
    var foods = ["Beef", "Bread", "Potato"]
     @State var searchText: String = ""
     
    var body: some View {
     NavigationView {
         List {
             TextField("Search", text: $searchText)
                 .padding(7)
                 .background(Color(.systemGray6))
                 .cornerRadius(8)
             
             ForEach(
                 foods.filter {
                     searchText.isEmpty ||
                     $0.localizedStandardContains(searchText)
                 },
                 id: \.self
             ) { eachFood in
                 Text(eachFood)
             }
         }
         .navigationBarTitle("Quick Add")
         .navigationBarHidden(true)
     }
     
    }
}

struct QuickAdd_Previews: PreviewProvider {
    static var previews: some View {
        QuickAdd()
    }
}
