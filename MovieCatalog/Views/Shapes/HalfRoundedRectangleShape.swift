//
//  HalpRoundedRectangle.swift
//  MovieCatalog
//
//  Created by  Aleksey Feofilov on 25.10.2022.
//

import SwiftUI

struct HalfRoundedRectangleShape: Shape {
    enum Side {
        case left
        case right
        var value: Bool {
            switch self {
            case .left:
                return true
            case .right:
                return false
            }
        }
    }
    
    var cornerRadius: CGFloat
    var roundedSide: Side = .left
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if(roundedSide.value){
            path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + CGFloat(cornerRadius), y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.minX + CGFloat(cornerRadius), y: rect.maxY - CGFloat(cornerRadius)),
                radius: CGFloat(cornerRadius), startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + CGFloat(cornerRadius)))
            path.addArc(
                center: CGPoint(x: rect.minX + CGFloat(cornerRadius), y: rect.minY + CGFloat(cornerRadius)),
                radius: CGFloat(cornerRadius), startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: roundedSide.value ? rect.maxX : rect.minX, y: rect.maxY))
        }
        else {
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX - CGFloat(cornerRadius), y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.maxX - CGFloat(cornerRadius), y: rect.maxY - CGFloat(cornerRadius)),
                radius: CGFloat(cornerRadius), startAngle: .degrees(90), endAngle: .degrees(0), clockwise: true)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + CGFloat(cornerRadius)))
            path.addArc(
                center: CGPoint(x: rect.maxX - CGFloat(cornerRadius), y: rect.minY + CGFloat(cornerRadius)),
                radius: CGFloat(cornerRadius), startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: roundedSide.value ? rect.maxX : rect.minX, y: rect.maxY))
        }

        return path
    }
}

struct HalfRoundedRectangleShape_Previews: PreviewProvider {
    static var previews: some View {
        HalfRoundedRectangleShape(cornerRadius: 10, roundedSide: .right)
            .fill(.red)
            .frame(width: 300, height: 300)
    }
}
