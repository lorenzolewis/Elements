//
//  ShellView.swift
//  Elements
//
//  Created by Lorenzo Lewis on 6/6/20.
//  Copyright © 2020 Lorenzo Lewis. All rights reserved.
//

import SwiftUI

struct ShellView: View {
    let element: Element
    let geo: GeometryProxy
    @State private var isAnimating = false
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        
        ZStack {
            Circle()
                .foregroundColor(elementColor[self.element.category])
                .frame(height: self.geo.size.width * 0.25)
            
            Text(self.element.symbol)
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
            
            ForEach(0..<self.element.shells.count, id: \.self) { index in
                ZStack {
                    
                    ShellCircleView(element: self.element, index: index, geo: self.geo)
                    
                    ForEach(0..<self.element.shells[index]) { int in
                        ShellCircleMoleculeView(element: self.element, index: index, int: int, geo: self.geo)
                    }
                }
                .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                .animation(self.isAnimating ? Animation.linear(duration: Double(index + 10) ).repeatForever(autoreverses: false) : .default)
                .onAppear { self.isAnimating = true }
                .onDisappear { self.isAnimating = false }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct ShellCircleView: View {
    
    let element: Element
    let index: Int
    let geo: GeometryProxy
    
    var body: some View {
        Circle()
            .stroke(Color.primary, lineWidth: 1)
            .frame(
                height: (self.geo.size.width * 0.65) *
                    (CGFloat(index + 1) / CGFloat(self.element.shells.count)) + (self.geo.size.width * 0.25)
        )
    }
}

struct ShellCircleMoleculeView: View {
    let element: Element
    let index: Int
    let int: Int
    let geo: GeometryProxy
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.001)
            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
            .foregroundColor(elementColor[element.category])
            .rotationEffect(.degrees(Double((int + 1) * (360 / (element.shells[index])))))
            .frame(
                height: (self.geo.size.width * 0.65) *
                    (CGFloat(index + 1) / CGFloat(self.element.shells.count)) + (self.geo.size.width * 0.25)
        )
    }
}

struct ShellView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geo in
            ShellView(element: ElementsModel().elements[30], geo: geo)
        }
    }
}
