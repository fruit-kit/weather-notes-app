//
//  NoteDetailView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import SwiftUI

struct NoteDetailView: View {
    
    let note: Note
    
    var body: some View {
        VStack(spacing: 10) {
            Text(note.title)
                .font(.title)
                .bold()
            
            Text(note.text)
            
            HStack {
                Text("\(note.weatherDescription),")
                Text("\(note.temperature)°C")
                Image(systemName: note.icon)
            }
            
            Text(note.date.formatted(date: .abbreviated, time: .shortened))
        }
        .navigationTitle("Details")
    }
}

#Preview {
    NavigationStack {
        NoteDetailView(note: Note(title: "Title",
                                  text: "Some text",
                                  date: Date(),
                                  temperature: 18,
                                  weatherDescription: "Sunny",
                                  icon: "sun.max.fill"))
    }
}
