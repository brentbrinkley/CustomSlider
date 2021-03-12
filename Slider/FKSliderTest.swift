//
//  FKSliderTest.swift
//  Slider
//
//  Created by Brent Brinkley on 3/8/21.
//

import SwiftUI

struct FKSliderTest: View {

    
    public init<V>(
        value: Binding<V>,
        in bounds: ClosedRange<V> = 0...1,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) where V : BinaryFloatingPoint,
            V.Stride : BinaryFloatingPoint {
        
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//struct FKSliderTest_Previews: PreviewProvider {
//    static var previews: some View {
//        FKSliderTest(value: 10.0)
//    }
//}

//struct Teststruct {
//    @State var testing
//}
