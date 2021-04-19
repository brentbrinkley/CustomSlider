//
//  OrangeCircle.swift
//  Slider
//
//  Created by Brent Brinkley on 4/17/21.
//

import SwiftUI

struct OrangeCircle: View {
    let circleStart: CGFloat = 0.0
    
    let circleEnd: CGFloat = 1.0
    
    let color: Color = .orange
    
    @Binding var baseValue: Float
    let bounds: ClosedRange<CGFloat>
    
    let dash: CGFloat = 12.577477 * 0.74
    
    var body: some View {
        
        if bounds.lowerBound < 0 {
            ZStack {
                Circle()
                    .trim(from: 0.5, to: trimOffset()) // - 0.1)
                    .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5, dash], dashPhase: 20))
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0.5, to: 1 - trimOffset()) // - 0.1)
                    .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5, dash], dashPhase: 20))
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(180))
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
//                    .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
            }
        } else {
            Circle()
                .trim(from: 0.0, to: trimOffset())
                .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5, dash], dashPhase: 20))
                .frame(width: 100, height: 100)
        }
    }
    
    func rngOffset(_ range: ClosedRange<CGFloat>) -> CGFloat {
        return range.upperBound - range.lowerBound
    }
    
    func trimOffset() -> CGFloat {
        return CGFloat(baseValue) / rngOffset(bounds) * 0.9  - bounds.lowerBound / rngOffset(bounds)
    }
}

//struct OrangeCircle_Previews: PreviewProvider {
//    static var previews: some View {
////        OrangeCircle()
//    }
//}
