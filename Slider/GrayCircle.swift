//
//  GrayCircle.swift
//  Slider
//
//  Created by Brent Brinkley on 4/17/21.
//

import SwiftUI

struct GrayCircle: View {
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 1.0)
            .stroke(Color.gray ,style: StrokeStyle(lineWidth: 6, lineCap: .round, dash: [0.5,8], dashPhase: 20))
            .frame(width: 100, height: 100)
    }
}

struct GrayCircle_Previews: PreviewProvider {
    static var previews: some View {
        GrayCircle()
    }
}
