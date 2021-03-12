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
        GeometryReader{ geo in
            VStack {
               
                ZStack {
                    FKKnob(color: Color.orange)
                }
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
