//
//  PieChartCell.swift
//  Perfin
//
//  Created by Ярослав Максимов on 10.12.2021.
//

import SwiftUI

public struct PieChartCell : View {
    @State private var show:Bool = false
    var rect: CGRect
    var radius: CGFloat {
        return min(rect.width, rect.height)/2
    }
    var startDeg: Double
    var endDeg: Double
    var path: Path {
        var path = Path()
        path.addArc(center:rect.mid , radius:self.radius, startAngle: Angle(degrees: self.startDeg), endAngle: Angle(degrees: self.endDeg), clockwise: false)
        path.addLine(to: rect.mid)
        path.closeSubpath()
        return path
    }
    var index: Int
    var backgroundColor:Color
    var accentColor:Color
    public var body: some View {
        path
            .fill()
            .foregroundColor(self.accentColor)
            .overlay(path.stroke(self.backgroundColor, lineWidth: 2))
            .scaleEffect(self.show ? 1 : 0)
            .onAppear(){
                self.show = true
        }
    }
}

extension CGRect {
    var mid: CGPoint {
        return CGPoint(x:self.midX, y: self.midY)
    }
}
