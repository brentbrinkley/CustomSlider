//
//  TestCircle.swift
//  Slider
//
//  Created by Brent Brinkley on 4/18/21.
//

import SwiftUI

struct TestCircle: View {
    @State var counter: Double = 10.718711
    // 12.577477
    
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0.0, to: 1)
                .stroke(Color.gray ,
                        style: StrokeStyle(lineWidth: 6,
                                           lineCap: .round,
                                           dash: [0.5, CGFloat(counter)],
                                           dashPhase: 0))
                .frame(width: 100, height: 100)
            Slider(value: $counter, in: 0...100)
            Text("\(counter)")
        }
    }
}

struct TestCircle_Previews: PreviewProvider {
    static var previews: some View {
        TestCircle()
    }
}
