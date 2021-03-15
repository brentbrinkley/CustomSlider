//
//  FKKnob.swift
//
//  Created by Brent Brinkley on 3/7/21.
//

import SwiftUI

struct FKKnob: View {
    // Set the color for outer ring and inner dash
    let color: Color
    
    // Minimum appearance value:
    let circleMin: CGFloat = 0.0
    
    // Maximum appearance value
    let circleMax: CGFloat = 0.9
    
    // Because our circle is missing a chunk of degrees we have to account
    // for this adjustment
    let circOffsetAmnt: CGFloat = 1 / 0.09
    
    // Offset needed to allign knob properly
    let knobOffset: Angle = .degrees(110)
    
    // calculate the our circle's mid point
    var cirMidPoint: CGFloat {
        0.4 * circOffsetAmnt
    }
    
    // User modfiable control value
    @State var value: CGFloat = 0.0
    
    var body: some View {
        
        VStack {
            ZStack {
                
                // MARK: - Knob with dashline
                
                Knob(color: color)
                    .rotationEffect(
                        // Currently controlled by slider
                        .degrees(max(0, Double(360 * value )))
                    )
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ value  in
                                    
                                    // Need help here setting amount based on x and y touch drag
                                    
                                }))
                
                // MARK: - Greyed Out Ring
                
                Circle()
                    .trim(from: circleMin, to: circleMax)
                    .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
                // MARK: - Colored ring inidicating change
                
                Circle()
                    .trim(from: circleMin, to: value)
                    .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
            }
            .rotationEffect(knobOffset)
            
            Text("\(value * circOffsetAmnt, specifier: "%.0f")")
            
            Slider(value: $value, in: circleMin...circleMax)
                .frame(width: 300)
                .accentColor(.orange)
        }
    }
}

struct DashedCircle_Previews: PreviewProvider {
    static var previews: some View {
        FKKnob(color: Color.orange)
    }
}
