//
//  CradView.swift
//  CardScrollAni
//
//  Created by Prajwal U on 16/01/24.
//

import SwiftUI

struct CradView: View {
    @State var isAnimate : Bool = false
    var body: some View {
        
        ZStack {
            Text("Scroll Animation \n using GeometryReader").font(.title2)
                .bold()
                .fontDesign(.monospaced)
                .multilineTextAlignment(.center)
                .scaleEffect(isAnimate ? 1.02 : 1.0)
                .foregroundColor(isAnimate ? Color.accentColor.opacity(0.7) : Color.mint.opacity(0.3))
                .offset(y: -230)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1 ..< 6) { number in
                        GeometryReader { geometry in
                            SingleCard(title: "\(number).circle", colorCard: .mint)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -20), axis: (x: 0, y: 10.0, z: 0))
                        }.frame(width: 190, height: 250)
                        //.frame(width: 200, height: 350)
                    }
                }
                .padding(.vertical , 190)
                .padding(.horizontal ,100)
            }
        }
        .onAppear {withAnimation(
            Animation
                .easeInOut(duration: 1.5)
                //.repeatForever()
        )
            {
                isAnimate.toggle()
            }
        }
    }
}

#Preview {
    CradView()
}
