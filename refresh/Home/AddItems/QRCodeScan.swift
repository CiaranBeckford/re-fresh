//
//  QRCodeScan.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/20/20.
//

import SwiftUI

struct QRCodeScan: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?
    @Binding var fridgeList : [Item]
    var body: some View {
            VStack(spacing: 10) {
                if self.scannedCode != nil {
                    NavigationLink("Next page", destination: NextView(scannedCode: scannedCode!, fridgeList: self.$fridgeList), isActive: .constant(true)).hidden()
                }
                Button("Scan Code") {
                    self.isPresentingScanner = true
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Text("Scan a QR code to begin")
            }
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
    }
}

struct NextView : View {
    @State var scannedCode : String
    @State private var items: [Item] = []
    @State private var selection: String? = nil
    @State var isTapped = false
    @Binding var fridgeList : [Item]
    @ObservedObject var fridgeItems = FridgeItems()
    var body: some View {
        VStack{
            List(items) { fridgeItem in
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
            
            NavigationLink(destination: YourFridge(fridgeItems: self.fridgeList)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true), tag: "homepage", selection: $selection) {  }
            Button(action: {
                
                //self.fridgeList.append(Item(action: "Potato", pic: "potato", expiration: 60.0, account: "profile2"))
                self.selection = "homepage"
            }) {
                HStack {
                    
                    Text("Add Items")
                        .padding(.horizontal, UIScreen.main.bounds.height*0.12)
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
        .onAppear{
            self.toArray()
        }
        
        
    }
    
    func toArray() {
        if self.scannedCode != nil {
            
            let array = scannedCode.components(separatedBy: ", ")
            for i in array {
                let xpir = Float.random(in: 1.0..<100.0)
                
                items.append(Item(action: i, pic: i.lowercased(), expiration: xpir, account: "profile1"))
            }
            self.fridgeList.append(contentsOf: items)
            //self.fridgeList.append(contentsOf: items)
            //
            //self.fridgeItems.items.append(contentsOf: items)
            /*
            for i in items {
                self.fridgeItems.items.append(i)                
            }*/
        }
    }
}
