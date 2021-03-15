//
//  Knob.swift
//  Slider
//
//  Created by Brent Brinkley on 3/6/21.
//

import SwiftUI

struct Knob: View {
    @State var angle = Angle(radians: 0)
    let color: Color
    
    var body: some View {
        
        VStack {
            ZStack {
                
                // MARK: - Main Knob
                
                Circle()
                    .stroke(Color.gray, lineWidth: 5)
                    .frame(width: 70, alignment: .center)
                
                // MARK: - Dash line within Circle
                
                Rectangle()
                    .fill(color)
                    .cornerRadius(5.0)
                    .frame(
                        width: 60/3,
                        height: 60/14,
                        alignment: .center
                    )
                    .offset(x: -60 * 0.25)
                    .rotationEffect(.degrees(180))
            }
            .frame(width: 60, height: 60)
            .padding()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Knob(color: Color.red)
    }
}
