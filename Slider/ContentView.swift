//
//  ContentView.swift
//  Slider
//
//  Created by Brent Brinkley on 3/6/21.
//

import SwiftUI

struct ContentView: View {
    let title = "Volume"
    let value = 10
    var body: some View {
        let count =  31
        
        GeometryReader{ geo in
            VStack {
                Text(title)
                    .foregroundColor(.gray)
                ZStack {
                    
                    Knob()
                    
                    // MARK: - Outer Ring
                    
                    ForEach(0..<count){ i in
                        Dot(angle: .degrees(Double(i) / Double(count)) * 320, color: .orange)
                    }
                    .rotationEffect(.degrees(-65.0), anchor: .center)
                }
                Text("\(value)")
                    .foregroundColor(.gray)
                    .offset(y: -16)
            }
            .frame(width:geo.frame(in: .local).width, height: geo.frame(in: .local).height)
         
        }.frame(height: 150)
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
