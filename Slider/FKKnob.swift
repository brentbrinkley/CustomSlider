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
    
    @State private var baseValue: CGFloat = 0.0
    
    @State private var startDragValue = -1.0
    
    // MARK: - Slider Controls
    @Binding var value: AUValue
    
    var bounds: ClosedRange<CGFloat>
    
    var body: some View {
        
        
        
        // MARK: - Knob with dashline
        
        Knob(color: .orange)
            .rotationEffect(
                .degrees(max(0, Double(360   * (value / Float(rngOffset(range: bounds))) - (360 * Float(bounds.lowerBound / rngOffset(range: bounds))))))
            )
            .gesture(DragGesture(minimumDistance: 0)
                        .onEnded({ _ in
                            startDragValue = -1.0
                        })
                        
                        .onChanged { dragValue in
                            let touchDifferential =  touchDifference(dragValue)
                           
                            setInitialDragVal()
                            
                            let computedTouch = computeTouch(touchDifferential)
                           
                            baseValue = getBaseVal(computedTouch)
                            
                            // Normalize base value to range between 0.0 and 1.0 to match our trim values
                            baseValue = baseValue / touchAmt
                            
                            // Adjusts the value by baseValue and rangeOffset
                            value = Float(baseValue * rngOffset(range: bounds) + bounds.lowerBound)
                            
                            print(360   * (value / Float(rngOffset(range: bounds))))
                        })
        
        
    }
    
   // MARK: - Start functions
    
    // subtract where touch initially begins to current touch location
    func touchDifference(_ drag: DragGesture.Value) -> CGFloat {
        return drag.startLocation.x - drag.location.x
    }
    
    // if value equals -1.0 set startDragValue to baseValue
    func setInitialDragVal() {
        if startDragValue == -1.0 {
            startDragValue = Double(baseValue)
        }
    }
    
    // add -1.0 or baseValue to touchDifferential
    func computeTouch(_ diff: CGFloat) -> Double {
        return startDragValue + Double(diff)
    }
    
    // limit touch return data to between 0 and touchAmount
    func getBaseVal(_ newVal: Double) -> CGFloat {
        return CGFloat(newVal < 0 ? 0 : newVal > Double(touchAmt) ? Double(touchAmt) : newVal)
    }
    
    func rngOffset(range: ClosedRange<CGFloat>) -> CGFloat {
        return range.upperBound - range.lowerBound
    }
    
    func offSetCirc() {
        
    }
}

//struct FKKnob_Previews: PreviewProvider {
//    static var previews: some View {
//        FKKnob(label: "Volume", input: 10, specifier: "%.1f", outputValue: 0.0).environmentObject(AppState())
//    }
//}
