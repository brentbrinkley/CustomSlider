//
//  FKKnob.swift
//  Slider
//
//  Created by Brent Brinkley on 4/16/21.
//

import SwiftUI
import AVKit

struct FKKnob: View {
    
    // MARK: - Touch Controls
    
    let touchAmt: CGFloat = 130
    
    let fullCirc: Float = 360
    
    let fullCircOffst: Float =  360 * 0.9
    
    @State private var baseValue: CGFloat = 0.0
    
    @State private var startDragValue = -1.0
    
    // MARK: - Slider Controls
    
    @Binding var value: AUValue
    
    var bounds: ClosedRange<CGFloat>
    
    var body: some View {
        
        // MARK: - UI Knob with dashline
        
        ZStack {
            Knob(color: .orange)
                .rotationEffect(
                    .degrees(max(0, initialCircleState()))
                )
                .gesture(DragGesture(minimumDistance: 0)
                            .onEnded({ _ in
                                startDragValue = -1.0
                            })
                            
                            .onChanged { dragValue in
                                let touchDifferential =  touchDifference(dragValue)
                               
                                setInitialDragVal()
                                
                                let computedTouch = computeTouch(touchDifferential)
                                
                                print(computedTouch)
                                
                                baseValue = getBaseVal(computedTouch)
                                
                                // Normalize base value to range between 0.0 and 1.0 to match our trim values
                                let normalizeVal = baseValue / touchAmt
                                
                                // Adjusts the value by baseValue and rangeOffset
                                value = Float(normalizeVal * rngOffset(range: bounds) + bounds.lowerBound)
                        })
            GrayCircle(bounds: bounds)
            OrangeCircle(baseValue: $value, bounds: bounds)
           
        }
        .rotationEffect(bounds.lowerBound < 0 ? .degrees(90) : .degrees(107))
    }
    
   // MARK: - functional programming to the rescue
    
    // subtract where touch initially begins to current touch location
    func touchDifference(_ drag: DragGesture.Value) -> CGFloat {
        print("startX: \(drag.startLocation.x)")
        print("dragX: \(drag.location.x)")
        return drag.startLocation.x - drag.location.x
    }
    
    // if value equals -1.0 set startDragValue to baseValue
    func setInitialDragVal() {
        if startDragValue == -1.0 {
            startDragValue = Double(baseValue)
        }
        print("StartDragVal: \(startDragValue)")
    }
    
    // add -1.0 or baseValue to touchDifferential
    func computeTouch(_ diff: CGFloat) -> Double {
        print("Diff: \(diff)")
        return startDragValue + Double(diff)
    }
    
    // limit touch return data to between 0 and touchAmount
    func getBaseVal(_ newVal: Double) -> CGFloat {
        return CGFloat(newVal < 0 ? 0 : newVal > Double(touchAmt) ? Double(touchAmt) : newVal)
    }
    
    // gets the offset amounts for different ranges
    func rngOffset(range: ClosedRange<CGFloat>) -> CGFloat {
        return range.upperBound - range.lowerBound
    }
    
    // corrects offset amount created by circle rotation by changing ranges
    func circOffset() -> Float {
        return fullCirc * Float(bounds.lowerBound / rngOffset(range: bounds))
    }
    
    // puts our offsets togther to correct the circles initial positioning
    func initialCircleState() -> Double {
        return Double(fullCircOffst  * (value / Float(rngOffset(range: bounds))) - circOffset())
    }
}

//struct FKKnob_Previews: PreviewProvider {
//    static var previews: some View {
//        FKKnob(label: "Volume", input: 10, specifier: "%.1f", outputValue: 0.0).environmentObject(AppState())
//    }
//}
