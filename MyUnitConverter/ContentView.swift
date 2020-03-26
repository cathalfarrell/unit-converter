//
//  ContentView.swift
//  MyUnitConverter
//
//  Created by Cathal Farrell on 25/03/2020.
//  Copyright © 2020 Cathal Farrell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnitPercentageIndex = 2
    @State private var outputUnitPercentageIndex = 2

    let unitsArray = ["meters", "kilometers", "feet", "yards", "miles"]

    var convertedResult: Double {

        let inputValue = Double(inputNumber) ?? 0
        var convertedValue: Double = 0.0

        switch (inputUnitPercentageIndex, outputUnitPercentageIndex) {
        case (0,0),(1,1),(2,2),(3,3),(4,4):
            //Same input & output units - so no conversion required
            convertedValue = inputValue
        case (0,1) :
            //meters -> kilometers
            convertedValue = inputValue / 1000
        case (0,2) :
            //meters -> feet
            convertedValue = inputValue * 3.28084
        case (0,3) :
            //meters -> yards
            convertedValue = inputValue * 1.09361
        case (0,4) :
            //meters -> miles
            convertedValue = inputValue * 0.000621371
        case (1,0) :
            //kilometers -> meters
            convertedValue = inputValue * 1000
        case (1,2) :
            //kilometers -> feet
            convertedValue = inputValue * 3280.84
        case (1,3) :
            //kilometers -> yards
            convertedValue = inputValue * 1093.61
        case (1,4) :
            //kilometers -> miles
            convertedValue = inputValue * 0.621371
        case (2,0) :
            //feet -> meters
            convertedValue = inputValue / 3.28084
        case (2,1) :
            //feet -> kilometers
            convertedValue = inputValue / 3280.84
        case (2,3) :
            //feet -> yards
            convertedValue = inputValue / 3
        case (2,4) :
            //feet -> miles
            convertedValue = inputValue / 5280
        case (3,0) :
            //yards -> meters
            convertedValue = inputValue / 1.09361
        case (3,1) :
            //yards -> kilometers
            convertedValue = inputValue / 1093.61
        case (3,2) :
            //yards -> feet
            convertedValue = inputValue * 3
        case (3,4) :
            //yards -> miles
            convertedValue = inputValue / 1760
        case (4,0) :
            //miles -> meters
            convertedValue = inputValue * 1609.34
        case (4,1) :
            //miles -> kilometers
            convertedValue = inputValue * 1.60934
        case (4,2) :
            //miles -> feet
            convertedValue = inputValue * 5280
        case (4,3) :
            //miles -> yards
            convertedValue = inputValue * 1760
        default:
            print("Not yet handled")
        }

        return convertedValue
    }

    var body: some View {
        Form {
            Section(header: Text("Units to convert")) {
                TextField("Enter Number To Convert", text: $inputNumber)
                .keyboardType(.numberPad)
                Picker("Input Unit", selection: $inputUnitPercentageIndex) {
                    ForEach(0 ..< unitsArray.count) {
                        Text("\(self.unitsArray[$0])")
                    }

                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Select Unit That You Want To Convert To")) {
                Picker("Output Unit", selection: $outputUnitPercentageIndex) {
                    ForEach(0 ..< unitsArray.count) {
                        Text("\(self.unitsArray[$0])")
                    }

                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Result")) {
                Text("\(convertedResult)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
