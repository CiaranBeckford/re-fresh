//
//  SignIn.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/19/20.
//

import SwiftUI

struct SignIn: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var checked : Bool = false
    @State private var selection: String? = nil
    
    var body: some View {
            VStack{
                Text("Welcome back!")
                    .font(.custom("Helvetica Neue", size: 28))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, UIScreen.main.bounds.height*0.15)
                NavigationLink(destination: homepage()
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), tag: "Facebook-Login", selection: $selection ) {  }
                Button(action: {
                    
                    self.selection = "Facebook-Login"
                }) {
                    HStack {
                        HStack{
                            Image("facebook-logo")
                                .padding(.leading, 10)
                            Spacer()
                            Text("CONTINUE WITH FACEBOOK")
                                .font(.custom("Helvetica Neue", size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(Color.init(0xF6F1FB))
                                .padding(.trailing, UIScreen.main.bounds.width*0.19)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.init(0x7583CA))
                    .cornerRadius(30)
                }
                .padding(.horizontal, 15)
                .padding(.top, 35)
                
                NavigationLink(destination: homepage().navigationBarTitle("")
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true), tag: "Google-Login", selection: $selection) {  }
                Button(action: {
                    
                    self.selection = "Google-Login"
                }) {
                    HStack {
                        HStack{
                            Image("google-logo")
                                .padding(.leading, 5)
                            Spacer()
                            Text("CONTINUE WITH GOOGLE")
                                .font(.custom("Helvetica Neue", size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(Color.init(0x3F414E))
                                .padding(.trailing, UIScreen.main.bounds.width*0.22)
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: .infinity)
                            .stroke(Color.gray, lineWidth: 1)
                            )
                }
                .padding(.horizontal, 15)
                .padding(.top, 15)
                
                Text("OR LOG IN WITH EMAIL")
                    .font(.custom("Helvetica Neue", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(0xA1A4B2))
                    .padding(.top, 15)
                Group {
                    HStack{
                        TextField("Email", text: $email)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                    }
                    .background(Color.init(0xF2F3F7))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                    
                    HStack{
                        SecureField("Password", text: $password)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                    }
                    .background(Color.init(0xF2F3F7))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                }
                
                
                Spacer()
                Group {
                    if self.email != "" && self.password != "" {
                        
                        NavigationLink(destination: homepage()
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true), tag: "SignIn", selection: $selection) {  }
                        Button(action: {
                            
                            self.selection = "SignIn"
                        }) {
                            HStack {
                                
                                Text("Sign In")
                                    .padding(.horizontal, UIScreen.main.bounds.height*0.15)
                                    .foregroundColor(Color.init(0xF6F1FB))
                                    .font(.custom("Helvetica Neue", size: 14))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.teal)
                        .cornerRadius(30)
                        .padding(.horizontal, 15)
                        .padding(.bottom, UIScreen.main.bounds.height*0.05)
                    }
                    else {
                        Button(action: {
                        }) {
                            HStack {
                                
                                Text("Log in")
                                    .padding(.horizontal, UIScreen.main.bounds.height*0.15)
                                    .foregroundColor(Color.init(0xF6F1FB))
                                    .font(.custom("Helvetica Neue", size: 14))
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(30)
                        .padding(.horizontal, 15)
                        .padding(.bottom, UIScreen.main.bounds.height*0.05)
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                }
                
            }
            
            .frame(maxWidth: UIScreen.main.bounds.width)
            .ignoresSafeArea()
            
        
        
    }
    
    func checkboxSelected(id: String, isMarked: Bool) {
        self.checked = isMarked
     }
}
