//
//  ContentView.swift
//  Convertio
//
//  Created by William Mead on 01/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var unitInput: Double?
    @State private var unitOutput: Double?
    @State private var selectedInput: String = "hours"
    @State private var selectedOutput: String = "minutes"
    let timeUnits: Array<String> = ["seconds", "minutes", "hours", "days"]
    var body: some View {
        NavigationView {
            ZStack {
                Color.mint.ignoresSafeArea()
                Form {
                    Section {
                        HStack {
                            Spacer()
                            TextField("Enter time amount", value: $unitInput, format: .number)
                                .multilineTextAlignment(.trailing)
                                .fixedSize()
                            Text(selectedInput)
                        }
                        Picker("Input", selection: $selectedInput) {
                            ForEach(timeUnits, id: \.self) {
                                Text($0).tag($0)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("🕰 Input").foregroundColor(.white)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Text(unitOutput ?? 0.0, format: .number)
                            Text(selectedOutput)
                        }
                        Picker("Output", selection: $selectedOutput) {
                            ForEach(timeUnits, id: \.self) {
                                Text($0).tag($0)
                            }
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("⏰ Output").foregroundColor(.white)
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
