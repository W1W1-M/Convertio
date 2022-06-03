//
//  ContentView.swift
//  Convertio
//
//  Created by William Mead on 01/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var unitInput: Double?
    @State private var selectedInput: timeUnits = .hours
    @State private var selectedOutput: timeUnits = .minutes
    private var unitOutput: Double? {
        guard let unitInput = unitInput else {
            return nil
        }
        var inputSeconds: Double = 0.0
        switch selectedInput {
        case .seconds:
            inputSeconds = unitInput
        case .minutes:
            inputSeconds = unitInput*60
        case .hours:
            inputSeconds = unitInput*3600
        case .days:
            inputSeconds = unitInput*86400
        }
        switch selectedOutput {
        case .seconds:
            return inputSeconds
        case .minutes:
            return inputSeconds/60
        case .hours:
            return inputSeconds/3600
        case .days:
            return inputSeconds/86400
        }
    }
    enum timeUnits: String, CaseIterable {
        case seconds = "seconds"
        case minutes = "minutes"
        case hours = "hours"
        case days = "days"
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                Form {
                    Section {
                        HStack {
                            Spacer()
                            TextField("Enter time amount", value: $unitInput, format: .number)
                                .multilineTextAlignment(.trailing)
                                .fixedSize()
                            Text(selectedInput.rawValue)
                        }
                        Picker("Input", selection: $selectedInput) {
                            ForEach(timeUnits.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("🕰 Input").foregroundColor(.black)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Text(unitOutput ?? 0.0, format: .number)
                            Text(selectedOutput.rawValue)
                        }
                        Picker("Output", selection: $selectedOutput) {
                            ForEach(timeUnits.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("⏰ Output").foregroundColor(.black)
                    }
                }.navigationTitle("Convertio")
                .onAppear(perform: {
                    UITableView.appearance().backgroundColor = .clear
            })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
