//
//  ContentView.swift
//  Drawing
//
//  Created by Alex Bonder on 7/31/23.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 6, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - rect.width / 6, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 6, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + rect.width / 6, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ContentView: View {
    @State private var arrowWidth = 300.0
    @State private var arrowHeight = 300.0
    
    var body: some View {
        VStack {
            Spacer()
            Arrow()
                .fill(.blue)
                .frame(width: arrowWidth, height: arrowHeight)
            Spacer()
            Group {
                HStack {
                    Text("Width")
                    Slider(value: $arrowWidth, in: 100...500, step: 1)
                }
                HStack {
                    Text("Height")
                    Slider(value: $arrowHeight, in: 100...500, step: 1)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
