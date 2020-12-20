//
//  TitleScreen.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/19/20.
//

import SwiftUI

struct TitleScreen: View {
    @Environment (\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State private var selection: String? = nil
    var body: some View {
        NavigationView {
            VStack {
                	
                Text("R E / F R E S H")
                    .foregroundColor(Color.white)
                    .font(Font.custom("AirbnbCerealBold", size: 33))
                    .padding(.top, UIScreen.main.bounds.height*0.1)
                Text("Hi there!")
                    .foregroundColor(Color.init(0xFFECCC))
                    .font(.custom("Helvetica Neue", size: 25))
                    .padding(.top, UIScreen.main.bounds.height*0.1)
                Text("Welcome to RE/FRESH.")
                    .foregroundColor(Color.init(0xFFECCC))
                    .font(.custom("Helvetica Neue", size: 31))
                    .padding(.top, UIScreen.main.bounds.height*0.1	)

                Text("Organize your fridge and pantry space with your roommates. Save food, money, and kitchen real estate! ")
                    .foregroundColor(Color.white)
                    .font(.custom("Helvetica Neue", size: 16))
                    .multilineTextAlignment(.center)
                    .padding(.top, UIScreen.main.bounds.height*0.1)
                    .padding(.horizontal, UIScreen.main.bounds.width*0.25)
                Spacer()
                VStack{
                    NavigationLink(destination: SignUp(), tag: "SignUp", selection: $selection) {  }
                    NavigationLink(destination: SignIn(), tag: "SignIn", selection: $selection) {  }
                    
                    
                    Button(action: {
                        //self.presentationMode.wrappedValue.dismiss()
                        self.selection = "SignUp"
                    }) {
                        HStack {
                            
                            Text("Sign Up")
                                .padding(.horizontal, UIScreen.main.bounds.height*0.15)
                                .foregroundColor(Color.init(0x3F414E))
                                .font(.custom("Helvetica Neue", size: 14))
                        }
                    }
                    .padding()
                    .background(Color.init(0xEBEAEC))
                    .cornerRadius(38)
                    
                    Button(action: {	
                        self.presentationMode.wrappedValue.dismiss()
                        self.selection = "SignIn"
                    }) {
                        
                        Text("Already have an account? Log in")
                            .foregroundColor(Color.init(0xFFECCC))
                            .font(.custom("Helvetica Neue", size: 14))
                            .frame(width: 250)
                        
                    }
                    .padding(.vertical, 5).padding(.horizontal, UIScreen.main.bounds.width*0.35)
                    .cornerRadius(38)
                    
                    
                }
                .padding(.bottom, UIScreen.main.bounds.height*0.05)
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.teal)
            .ignoresSafeArea()
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
