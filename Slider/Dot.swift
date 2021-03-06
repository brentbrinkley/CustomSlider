//
//  Dot.swift
//  Slider
//
//  Created by Brent Brinkley on 3/6/21.
//

import SwiftUI

struct Dot: View {
    let angle: Angle
    var color: Color
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 5, height: 5)
            .offset(x: -50)
            .rotationEffect(self.angle, anchor: .center)
        
    }
}

struct Dot_Previews: PreviewProvider {
    static var previews: some View {
        Dot(angle: .degrees(10.0), color: .gray)
    }
}
