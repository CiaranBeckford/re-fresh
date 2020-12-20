//
//  SignUp.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/19/20.
//

import SwiftUI

struct SignUp: View {
    @State private var name : String = ""
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var checked : Bool = false
    @State private var selection: String? = nil
    
    var body: some View {
            VStack{
                
                Text("Create your account")
                    .font(.custom("Helvetica Neue", size: 28))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, UIScreen.main.bounds.height*0.15)
                Group {
                    NavigationLink(destination: CreateFridge(), tag: "Facebook-Login", selection: $selection ) {  }
                    Button(action: {
                        
                        //self.presentationMode.wrappedValue.dismiss()
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
                }
                Group {
                    NavigationLink(destination: CreateFridge(), tag: "Google-Login", selection: $selection) {  }
                    Button(action: {
                        //self.presentationMode.wrappedValue.dismiss()
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
                }
                
               
                
                Text("OR SIGN UP WITH EMAIL")
                    .font(.custom("Helvetica Neue", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color.init(0xA1A4B2))
                    .padding(.top, 15)
                Group {
                    HStack{
                        TextField("Full Name", text: $name)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 15)
                    }
                    .background(Color.init(0xF2F3F7))
                    .cornerRadius(15)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
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
               
                HStack {
                                               VStack {
                                Text("By tapping the box, you agree to the ")
                                    .font(.custom("Helvetica Neue", size: 12))
                                HStack (spacing: 0){
                                    Link("privacy policy", destination: URL(string: "https://refresh.flycricket.io/privacy.html")!)
                                        .font(.custom("Helvetica Neue", size: 12))
                                    Text(" and ")
                                        .font(.custom("Helvetica Neue", size: 12))
                                    Link("Terms of Service", destination: URL(string: "https://refresh.flycricket.io/terms.html")!)
                                        .font(.custom("Helvetica Neue", size: 12))
                                }
                            }.frame(width: 250)
                                   
                    CheckboxField(
                                        id: "privacy",
                                        label: "",
                                        size: 14,
                                        textSize: 14,
                                        callback: checkboxSelected
                    )
                }.padding(.leading, 30)
                .padding(.top, 10)
                
                
                
                Spacer()
                Group {
                    if self.checked && self.name != "" && self.email != "" && self.password != "" {
                        
                       
                        NavigationLink(destination: CreateFridge(), tag: "SignUp", selection: $selection ) {  }
                        Button(action: {
                            //self.presentationMode.wrappedValue.dismiss()
                        self.selection = "SignUp"
                        }) {
                            HStack {
                                
                                Text("Sign Up")
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
                                
                                Text("Sign Up")
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

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct CheckboxField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback
    }
    
    @State var isMarked:Bool = false
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}
