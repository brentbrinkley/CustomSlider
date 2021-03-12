//
//  DashedCircle.swift
//  Slider
//
//  Created by Brent Brinkley on 3/7/21.
//

import SwiftUI

struct FKKnob: View {
    // Minimum appearance value:
    let circleMin: CGFloat = 0.0
    
    // Maximum appearance value
    let circleMax: CGFloat = 0.9
    
    // Because our circle is missing a chunk of degrees we have to account
    // for this adjustment
    let circOffsetAmnt: CGFloat = 10 / 0.09
    
    // to offset for mixing knob change to 110
    @State var knobOffset: Angle = .degrees(110)
    
    // calculate the our circle's mid point
    var cirMidPoint: CGFloat {
        0.4 * circOffsetAmnt
    }
    
    // User modfiable control value
    @State var value: CGFloat = 0.0
    @State var knobRotate: Angle = .degrees(0)
    let color: Color
    
    
    var body: some View {
        
        VStack {
            ZStack {
                Knob(color: color)
                    //                    .rotationEffect(
                    //                        .degrees(max(0, Double(360 * value )))
                    //                    )
                    .rotationEffect(.degrees(max(0, Double(360 * value ))))
                    .gesture( DragGesture(minimumDistance: 0)
                                .onChanged({ value  in
                                    if value.location.y > 0 && value.location.y < 91 {
//                                        print((value.location.y * 0.01 * circOffsetAmnt))
//                                        print(value.translation)
                                        self.value = value.location.y * 0.01
                                    }
                                    
                                }
                                
                                ))
                
                
                Circle()
                    .trim(from: circleMin, to: circleMax)
                    .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(from: circleMin, to: value)
                    .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
            }
            .rotationEffect(knobOffset)
            
            Text("\((value * circOffsetAmnt))")
            //        Slider(value: $value, in: circleMin...circleMax)
            //        .frame(width: 300)
            //        .accentColor(.orange)
        }
    }
}

struct DashedCircle_Previews: PreviewProvider {
    static var previews: some View {
        FKKnob(color: Color.blue)
    }
}
