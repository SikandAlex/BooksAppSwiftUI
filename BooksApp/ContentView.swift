//
//  ContentView.swift
//  BooksApp
//
//  Created by Alex Sikand on 4/5/20.
//  Copyright © 2020 AlexSikandEngineering. All rights reserved.
//

import SwiftUI

let lightGray = Color(hex: "#F1F5FA")

struct ContentView: View {
    var body: some View {
        ZStack {
            lightGray.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Text("My Books").font(.largeTitle).fontWeight(.bold)
                    .padding([.leading, .trailing, .bottom, .top])
                    Spacer()
                }
                HStack {
                    Text("All Genres")
                    .font(.footnote)
                        .foregroundColor(.white)
                        
                    .padding(10)
                        .background(Capsule()).foregroundColor(.black)
                        
                        .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.black, lineWidth: 2)).shadow(color: Color.black.opacity(0.2), radius: 22, x: 0, y: 0)
                    Text("History")
                    .font(.footnote)
                        .foregroundColor(.gray)
                        
                    .padding(10)
                        .background(Capsule()).foregroundColor(lightGray)
                        
                        .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.gray, lineWidth: 2).shadow(color: Color.black.opacity(0.2), radius: 22, x: 0, y: 0)
                            
                    )
                    Text("Philosophy")
                    .font(.footnote)
                        .foregroundColor(.gray)
                        
                    .padding(10)
                        .background(Capsule()).foregroundColor(lightGray)
                        
                        .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.gray, lineWidth: 2)).shadow(color: Color.black.opacity(0.2), radius: 22, x: 0, y: 0)
                    Text("Biography")
                    .font(.footnote)
                        .foregroundColor(.gray)
                        
                    .padding(10)
                        .background(Capsule()).foregroundColor(lightGray)
                        
                        .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.gray, lineWidth: 2)).shadow(color: Color.black.opacity(0.2), radius: 22, x: 0, y: 0)
                }.padding(.horizontal)
                HStack {
                    Text("In Progress").font(.title).fontWeight(.bold)
                    .padding([.leading, .top])
                    
                    Spacer()
                    Text("See All")
                    .font(.headline)
                        .foregroundColor(.gray).padding([.top, .trailing])
                    
                }
                Divider().padding(.horizontal)
                HStack(spacing: 20) {
                    VStack {
                        Image("book1").resizable().scaledToFit().cornerRadius(8).frame(maxHeight: 220).shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                        
                        Text("89 pages left")
                            .font(.footnote)
                            .foregroundColor(.gray).padding(6)
                        ZStack(alignment: .leading) {
                           Rectangle()
                              .foregroundColor(Color.gray)
                              .opacity(0.3)
                              .frame(width: 60.0, height: 8.0)
                           Rectangle()
                              .foregroundColor(Color.black)
                              .frame(width: 47.0, height: 8.0)
                        }
                        .cornerRadius(4.0)
                    }
                    VStack {
                        Image("book2").resizable().scaledToFit().cornerRadius(8).frame(maxHeight: 220).shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                        
                        Text("270 pages left")
                            .font(.footnote)
                            .foregroundColor(.gray).padding(6)
                        ZStack(alignment: .leading) {
                           Rectangle()
                              .foregroundColor(Color.gray)
                              .opacity(0.3)
                              .frame(width: 60.0, height: 8.0)
                           Rectangle()
                              .foregroundColor(Color.black)
                              .frame(width: 10.0, height: 8.0)
                        }
                        .cornerRadius(4.0)
                    }
                    
                    
                    
                    
                }.padding()
                HStack {
                    Text("Finished").font(.title).fontWeight(.bold)
                    .padding([.leading, .trailing, .top])
                    
                    Spacer()
                    Text("See All")
                    .font(.headline)
                        .foregroundColor(.gray).padding([.top, .trailing])
                    
                }
                Divider().padding(.horizontal)
                ScrollView {
                    HStack(spacing: 20) {
                        VStack {
                            Image("book3").resizable().scaledToFit().cornerRadius(8).frame(maxHeight: 220).shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                            
                            Text("Finished March 3")
                                .font(.footnote)
                                .foregroundColor(.gray).padding(6)
                           
                        }
                        VStack {
                            Image("book4").resizable().scaledToFit().cornerRadius(8).frame(maxHeight: 220).shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                            
                            Text("Finished April 29")
                                .font(.footnote)
                                .foregroundColor(.gray).padding(6)
                            
                        }
                        VStack {
                            Image("book5").resizable().scaledToFit().cornerRadius(8).frame(maxHeight: 220).shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                            
                            Text("Finished May 8")
                                .font(.footnote)
                                .foregroundColor(.gray).padding(6)
                            
                        }
                        
                        
                        
                        
                    }.padding([.leading, .top])
                }
                
                
                Spacer()
            }
        }
    }
        
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
