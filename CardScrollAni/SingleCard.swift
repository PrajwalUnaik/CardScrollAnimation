//
//  CardView.swift
//  CardScrollAni
//
//  Created by Prajwal U on 16/01/24.
//

import SwiftUI

struct SingleCard: View {
    
    let title: String
    let colorCard : Color
    
    @State var isAnimate : Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: title)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 350)
            .background(isAnimate ? colorCard.opacity(0.7) : Color.mint.opacity(0.3))
            .cornerRadius(10)
            .scaleEffect(isAnimate ? 1.02 : 1.0)
            .shadow(color: isAnimate ? colorCard.opacity(0.7) : Color.black.opacity(0.3), radius: isAnimate ? 20 : 10 , y: isAnimate ? 50 : 30)
        }.onAppear {withAnimation(
            Animation
                .easeInOut(duration: 1.5)
                //.repeatForever()
        )
        {
            isAnimate.toggle()
        }}
    }
}

#Preview {
    SingleCard(title: "circle", colorCard: .mint)
}
