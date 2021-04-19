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
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        GeometryReader{ geo in
            HStack {
                Spacer()
//                Text("\(appState.numVal)")
                FKKnob(value: $appState.numVal, bounds: -40...40)
                Spacer()
                FKKnob(value: $appState.numVal, bounds: 0...40)
                Spacer()
            }
            .frame(width:geo.frame(in: .local).width, height: geo.frame(in: .local).height)
        }.frame(height: 150)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppState())
    }
}
