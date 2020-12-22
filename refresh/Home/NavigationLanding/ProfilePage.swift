//
//  ProfilePage.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/16/20.
//

import SwiftUI

struct ProfilePage: View {
    @State private var selection: String? = nil
    var body: some View {
        NavigationView {
            VStack {
                
                VStack{
                    Image("profile1")
                        .resizable()
                        .frame(width: 100,  height: 100)
                    Text("Person 1")
                        .font(.title)
                }
                .navigationBarTitle(Text("My Profile"))
                
                VStack{
                    
                    Group {
                        Divider()
                        NavigationLink(destination: Text("Edit Profile"), tag: "EditProfile", selection: $selection) {  }
                        Button(action : {
                            self.selection = "EditProfile"
                        }){
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color.teal)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                Text("Edit Profile")
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        Divider()
                    }
                    
                    Group {
                        NavigationLink(destination: Text("Edit Email and Password"), tag: "settings", selection: $selection) {  }
                        Button(action : {
                            self.selection = "settings"
                        }){
                            HStack {
                                Image(systemName: "gear")
                                    .foregroundColor(Color.teal)
                                    .padding(.horizontal, 13)
                                    .padding(.vertical, 10)
                                Text("Email & Password")
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        Divider()
                    }
                    
                    Group {
                        NavigationLink(destination: Text("Notiflications"), tag: "notifications", selection: $selection ){ }
                        
                        Button(action : {
                            self.selection = "notifications"
                        }){
                            HStack {
                                Image(systemName: "bell")
                                    .foregroundColor(Color.teal)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                Text("Notifications")
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        Divider()
                    }
                    
                    Group {
                        NavigationLink(destination: Text("Contact Us"), tag: "ContactUs", selection: $selection ){ }
                        
                        Button(action : {
                            self.selection = "ContactUs"
                        }){
                            HStack {
                                Image(systemName: "phone")
                                    .foregroundColor(Color.teal)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 10)
                                Text("Contact Us")
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color.black)
                                    .padding(.leading, 10)
                                    .padding(.vertical, 10)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .padding(.trailing, 15)
                            }
                        }
                        
                        Divider()
                    }
                    
                    
                    
                }
                
                
                Spacer()
                
                
            
            }
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
