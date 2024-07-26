//
//  ContentView.swift
//  Biography
//
//  Created by Oleg Plugaru on 26.07.2024.
//

import SwiftUI

let screen = UIScreen.main

struct ContentView: View {
    
    let people = Person.stubbed
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Ellipse().fill(Color(red: 78/255, green: 88/255, blue: 81/255))
                    .rotationEffect(.degrees(90))
                    .offset(y: -screen.bounds.width * 0.7)
                    .edgesIgnoringSafeArea(.top)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(spacing: 20) {
                        Text("The Crazy Ones")
                            .font(.system(size: 36, weight: .medium))
                        Text("The misfits. The rebels. The troublemakers. The round pegs in the square holse. The ones who sees things differently")
                            .font(.system(size: 17))
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(self.people) { item in
                                GeometryReader { proxy in
                                    CardView(person: item)
                                        .rotation3DEffect(.degrees(Double(proxy.frame(in: .global).minX - 20) / -20), axis: (x: 0, y: 1, z: 0))
                                }
                                .frame(width: screen.bounds.width * 0.75, height: screen.bounds.height * 0.65)
                            }
                        }
                        .padding(.horizontal, 32)
                        .padding(.vertical)
                    }
                }
            }
            .background(Color(red: 235/255, green: 235/255, blue: 227/255))
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
