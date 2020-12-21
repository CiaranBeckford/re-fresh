//
//  ProfilePage.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct ProfilePage: View {
    @State var isTapped = false
    @ObservedObject var profileOptions = ProfileOptions()
    
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    Image("profile1")
                        .resizable()
                        .frame(width: 100,  height: 100)
                    Text("Person 1")
                        .font(.title)
                }
                .navigationBarTitle(Text("My Profile"))
            }
            NavigationView {
                List(profileOptions.options) { profileOption in
                NavigationLink(destination: OptionView(profileOption: profileOption), isActive: Binding<Bool>(get: { isTapped }, set: { isTapped = $0; })) {
                      HStack{
                          Image(profileOption.pic)
                            .resizable()
                            .frame(width: 25,  height: 25)
                          Text(profileOption.action)
                          Spacer()
                      }
                      .padding()
                      .frame(width: UIScreen.main.bounds.width*0.85, height: 60)
                      .background(Color.boneWhite)
                      .cornerRadius(10)
                      .shadow(color: .gray, radius: 5, x: 5, y: 5)
                  }
               }.navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}

struct OptionView: View {
   var profileOption: Option
   var body: some View {
    VStack{
        HStack{
            Text(profileOption.action)
            Image(profileOption.pic)
        }
    }
    
      
   }
}
