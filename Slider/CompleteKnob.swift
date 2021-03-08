//
//  DashedCircle.swift
//  Slider
//
//  Created by Brent Brinkley on 3/7/21.
//

import SwiftUI



struct CompleteKnob: View {
    let circleStart: CGFloat = 0.1
    let circleEnd: CGFloat = 1.0
    @State var startAmount: CGFloat = 0.1
    @State var endAmount: CGFloat = 1
    
    var body: some View {
        
        VStack {
            ZStack {
                Knob()
                    .rotationEffect(.degrees(Double(-360 / (10 * endAmount))))
                
                Circle()
                    .trim(from: circleStart, to: circleEnd)
                    .rotation(.degrees(70))
                    .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
                Circle()
                    .trim(from: startAmount, to: endAmount)
                    .rotation(.degrees(70))
                    .stroke(Color.orange ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
                    .frame(width: 100, height: 100)
                
               
            }
            Text("\(360 / (10 * endAmount))")
            Slider(value: $endAmount, in: circleStart...circleEnd)
                .frame(width: 300)
                .accentColor(.orange)
        }
    }
}

struct DashedCircle_Previews: PreviewProvider {
    static var previews: some View {
        CompleteKnob()
    }
}
