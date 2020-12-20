//
//  CreateFridge.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/19/20.
//

import SwiftUI

struct CreateFridge: View {
    @State private var code : String = ""
    @State private var name : String = ""
    @State private var selection: String? = nil
    @State private var fridgeName : String = ""
    var body: some View {
        VStack{
            Text("Create your first fridge")
                .font(.custom("Helvetica Neue", size: 28))
                .fontWeight(.bold)
                .padding(.top, 20)
            Spacer()
            HStack{
                TextField("Name", text: self.$fridgeName)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
            }
            .background(Color.init(0xF2F3F7))
            .cornerRadius(15)
            .padding(.horizontal,55)
            .padding(.top, 10)
            
            Text("OR JOIN AN EXISTING FRIDGE")
                .font(.custom("Helvetica Neue", size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color.init(0xA1A4B2))
                .padding(.top, 10)
            HStack{
                TextField("Fridge code", text: $code)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 15)
            }
            .background(Color.init(0xF2F3F7))
            .cornerRadius(15)
            .padding(.horizontal,55)
            .padding(.top, 10)
            Spacer()
            NavigationLink(destination: homepage().navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true), tag: "CreateFridge", selection: $selection) {  }
            if (self.code != "" && self.fridgeName == "") || (self.code == "" && self.fridgeName != ""){
                Button(action: {
                    
                    self.selection = "CreateFridge"
                    if self.fridgeName != "" {
                        UserDefaults.standard.setValue(self.fridgeName, forKey: "fridgeName")
                    }
                    if self.code != "" {
                        UserDefaults.standard.setValue(self.code, forKey: "fridgeCode")
                    }
                }) {
                    HStack {
                        
                        Text("GET STARTED")
                            
                            .fontWeight(.medium)
                            .padding(.horizontal, UIScreen.main.bounds.height*0.1)
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
                        
                        Text("GET STARTED")
                            
                            .fontWeight(.medium)
                            .padding(.horizontal, UIScreen.main.bounds.height*0.1)
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
}

struct CreateFridge_Previews: PreviewProvider {
    static var previews: some View {
        CreateFridge()
    }
}
