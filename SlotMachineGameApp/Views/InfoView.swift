//
//  InfoView.swift
//  SlotMachineGameApp
//
//  Created by Usha Sai Chintha on 23/09/22.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10)  {
            LogoView()
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(key: "Application", value: "Slot Machine")
                    FormRowView(key: "Platforms", value: "iPhone, iPad & Mac")
                    FormRowView(key: "Developer", value: "Usha")
                    FormRowView(key: "Designer", value: "Usha Sai")
                    FormRowView(key: "Music", value: "BTS")
                    FormRowView(key: "Website", value: "swiftuimasterclass.com")
                    FormRowView(key: "Copyright", value: "@ 2020 all rights reserved")
                    FormRowView(key: "Version", value: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary)
            , alignment: .topTrailing)
    }
}

struct FormRowView: View {
    
    var key: String
    var value: String
    
    var body: some View {
        HStack{
            Text(key)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
