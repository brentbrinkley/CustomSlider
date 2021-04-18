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
    @State var bounds: ClosedRange<CGFloat>
    
    var body: some View {
        Circle()
            .trim(from: circleStart, to: trimOffset())
            .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
            .frame(width: 100, height: 100)
    }
    
    func rngOffset(range: ClosedRange<CGFloat>) -> CGFloat {
        return range.upperBound - range.lowerBound
    }
    
    func trimOffset() -> CGFloat {
        return CGFloat(baseValue) / rngOffset(range: bounds)  - bounds.lowerBound / rngOffset(range: bounds)
    }
}

//struct OrangeCircle_Previews: PreviewProvider {
//    static var previews: some View {
////        OrangeCircle()
//    }
//}
