//
//  MembersPage.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//  Edited by Alice Zhang on 12/19/20.
//

import SwiftUI

struct MembersPage: View {
    @State var isTapped = false
    @ObservedObject var fridgeMembers = FridgeMembers()
    
    var body: some View {
        VStack{
            NavigationView {
                List(fridgeMembers.members) { fridgeMember in
                NavigationLink(destination: MemberView(fridgeMember: fridgeMember), isActive: Binding<Bool>(get: { isTapped }, set: { isTapped = $0; })) {
                      HStack{
                          Image(fridgeMember.pic)
                            .resizable()
                            .frame(width: 50,  height: 50)
                          Text(fridgeMember.action)
                          Spacer()
                      }
                      .padding()
                      .frame(width: UIScreen.main.bounds.width*0.85, height: 60)
                      .background(Color.boneWhite)
                      .cornerRadius(10)
                      .shadow(color: .gray, radius: 5, x: 5, y: 5)
                  }
               }.navigationBarTitle(Text("Members"))
            }
        }
    }
}

struct MembersPage_Previews: PreviewProvider {
    static var previews: some View {
        MembersPage()
    }
}

struct MemberView: View {
    var fridgeMember: Member
    @State var isTapped = false
    @State var progressValue: Float = 0.0
    @ObservedObject var fridgeItems = FridgeItems()
    
   var body: some View {
    HStack{
        Image(fridgeMember.pic)
        Text(fridgeMember.action)
    }
    NavigationView {
        List(fridgeItems.items) { fridgeItem in
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
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
   }
}
