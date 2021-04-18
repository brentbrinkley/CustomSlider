//
//  OldKnob.swift
//
//  Created by Brent Brinkley on 3/7/21.
//

import SwiftUI



struct OldKnob: View {
    
    // MARK: - Constants
    
    // Set the color for outer ring and inner dash
    let label: String
    
    let color: Color
    
    let input: CGFloat
    
    // Circle Trim points
    let circleStart: CGFloat = 0.0
    
    let circleEnd: CGFloat = 0.9
    
    // Offset needed to allign knob properly
    let knobOffset: Angle = .degrees(107)
    
    // Sets our base amount for touch
    let maxVal: CGFloat = 1.0
    
    
    
    // MARK: - State
    
    @State private var baseValue: CGFloat = 0.0
    
    @State private var startDragValue = -1.0
    
    // This will hold our adjusted data
    @State var outputValue: Float = 0.0
    
    var body: some View {
        
        VStack {
            Text(label)
            ZStack {
                ZStack {
                    
                    // MARK: - Knob with dashline
                    
                    Knob(color: color)
                        .rotationEffect(
//                            .degrees(max(0, Double(baseValue * (360 * circleEnd) / maxVal)))
                            .degrees(max(0, Double((360 * circleEnd) * baseValue)))
                        )
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onEnded({ _ in
                                        startDragValue = -1.0
                                    })
                                    .onChanged { dragValue in
                                        let diff =  dragValue.startLocation.y - dragValue.location.y
                                        
                                        if startDragValue == -1 {
                                            startDragValue = Double(baseValue)
                                        }
                                        
                                        let newValue = startDragValue + Double(diff)
                                        baseValue = CGFloat(newValue < 0 ? 0 : newValue > Double(100) ? Double(100) : newValue)
                                        
                                        // Normalize base value to range between 0.0 and 1.0 to match are trim values
                                        baseValue = baseValue / 100
//                                        outputValue = Float(baseValue * input / maxVal)
                                        
                                        
                                    })
                    
                    // MARK: - Greyed Out Ring
                    
                    Circle()
                        .trim(from: circleStart, to: 1.0)
                        .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                        .frame(width: 100, height: 100)
                    
                    // MARK: - Colored ring inidicating change
                    
                    Circle()
//                        .trim(from: circleStart, to: baseValue / maxVal * circleEnd)
                        .trim(from: circleStart, to: baseValue)
                        .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                        .frame(width: 100, height: 100)
                    
                }
//                .rotationEffect(knobOffset)
                Text("\(baseValue * 24)")
//                Text("\(outputValue, specifier: "%.0f")")
//                    .offset(y: 60)
                
            }
        }
    }
}

struct DashedCircle_Previews: PreviewProvider {
    static var previews: some View {
        OldKnob(label: "Volume", color: Color.orange, input: 20)
    }
}
