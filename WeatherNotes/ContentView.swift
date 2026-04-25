//
//  ContentView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                Text("Task 1")
                Text("Task 2")
                Text("Task 3")
                Text("Task 4")
                Text("Task 5")
            }
            .navigationTitle("Weather Notes")
        }
    }
}

#Preview {
    ContentView()
}
