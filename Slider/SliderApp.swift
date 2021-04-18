//
//  SliderApp.swift
//  Slider
//
//  Created by Brent Brinkley on 3/6/21.
//

import SwiftUI

@main
struct SliderApp: App {
    @StateObject var state = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(state)
        }
    }
}
