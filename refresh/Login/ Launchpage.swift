//
//   Launchpage.swift
//  refresh
//
//  Created by Ciaran Beckford on 12/18/20.
//

import SwiftUI

struct _Launchpage: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

        var body: some View {
            VStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("POP")
                }
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
}

struct _Launchpage_Previews: PreviewProvider {
    static var previews: some View {
        _Launchpage()
    }
}
