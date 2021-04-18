//
//  OldKnobCenter.swift
//  Slider
//
//  Created by Brent Brinkley on 3/21/21.
//

import SwiftUI

struct OldKnobCenter: View {
    
    // MARK: - Constants
    
    // User values
    let label: String
    
    let color: Color
    
    let rangeValue: CGFloat
    
    // Circle trim properties
    let circleStart: CGFloat = 0.0
    
    let circleMid: CGFloat = 0.55
    
    let circleEnd: CGFloat = 0.9
    
    
    // Offset amounts to style our circles
    let knobOffset: Angle = .degrees(107)
    
    let leftOffset: Angle = .degrees(2.2)
    
    let rightOffset: Angle = .degrees(-32.5)
    
    // Sets our base amount for touch
    let maxVal: CGFloat = 100
    
    // MARK: - State
    
    @State private var baseValue: CGFloat = 0
    
    @State private var startDragValue = -1.0
    
    // This will hold our adjusted data
    @State var outputValue: Float = 0.0
    
    var body: some View {
        
        VStack {
            Text(label)
//            ZStack {
                ZStack {
                    
                    // MARK: - Knob with dashline
                    
                    Knob(color: color)
                        .rotationEffect(
                            .degrees(max(0, Double(baseValue * (360 * circleEnd))))
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
                                        baseValue = CGFloat(newValue < 0 ? 0 : newValue > Double(maxVal) ? Double(maxVal) : newValue)
                                        
                                        // Normalize base value to range between 0.0 and 1.0 to match are trim values
                                        baseValue = baseValue / 100
                                        
                                        outputValue = Float((baseValue * (rangeValue * 2)) - rangeValue)
                                        
                                        
                                    })
                    
                    // MARK: - Greyed Out Ring
                    
                    Circle()
                        .trim(from: circleStart, to: circleEnd)
                        .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                        .frame(width: 100, height: 100)
                    
                    // MARK: - Right Circle
                    
                    Circle()
                        .trim(from: 0.45, to: baseValue * circleEnd)
                        .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: 4))
                    
                    
                    
                    // MARK: - Left Circle
                    
                    Circle()
                        .trim(from: circleMid, to: 1 - baseValue)
                        .stroke(color ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                        .frame(width: 100, height: 100)
                        .rotationEffect(Angle(degrees: 2))
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
//
                }
                .rotationEffect(knobOffset)
                
                //            Text("\(baseValue * 0.1, specifier: "%.0f")")
                
                
                
                Text("\(baseValue, specifier: "%.1f")")
//                    .offset(y: 60)
                
                Text("\(outputValue)")
//            }
        }
    }
}

struct FKKnobCenter_Previews: PreviewProvider {
    static var previews: some View {
        OldKnobCenter(label: "Pitch", color: Color.green, rangeValue: 20)
    }
}
