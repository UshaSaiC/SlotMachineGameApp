//
//  ContentView.swift
//  SlotMachineGameApp
//
//  Created by Usha Sai Chintha on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingInfoView: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 5) {
                
                LogoView()
                    .padding(.horizontal, 5)
                    .padding(.trailing, 5)
                
                Spacer()
                
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                VStack(alignment: .center, spacing: 0){
                    ZStack {
                        ReelView()
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0){
                        ZStack {
                            ReelView()
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        ZStack {
                            ReelView()
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    Button {
                        
                    } label: {
                        Image("gfx-spin")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                }
                .layoutPriority(2)
                
                Spacer()
                
                
                HStack {
                    HStack(alignment: .center, spacing: 0) {
                        Button {} label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                            .padding(5)
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 0) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                            .padding(5)
                        Button {} label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    }
                    
                }
            }
            .overlay(
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier())
                , alignment: .topLeading
            )
            .overlay(
                Button(action: {
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier())
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
        }
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
