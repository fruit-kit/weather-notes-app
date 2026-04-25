//
//  ContentView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import SwiftUI

struct ContentView: View {
    
    let notes: [Note] = [
        Note(title: "Title 1",
             text: "Some text 1",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill"),
        Note(title: "Title 2",
             text: "Some text 2",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill"),
        Note(title: "Title 3",
             text: "Some text 3",
             date: Date(),
             temperature: 18,
             weatherDescription: "Sunny",
             icon: "sun.max.fill")
    ]
    
    var body: some View {
        NavigationStack {
            List(notes) { note in
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.headline)
                    
                    HStack {
                        Text(note.text)
                            .font(.subheadline)
                        Spacer()
                        Text("\(note.temperature)°C")
                        Image(systemName: note.icon)
                    }
                    
                    HStack {
                        Text(note.date.formatted(date: .abbreviated, time: .shortened))
                    }
                }
                .padding(10)
            }
            .navigationTitle("Weather Notes")
        }
    }
}

#Preview {
    ContentView()
}
