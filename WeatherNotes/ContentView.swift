//
//  ContentView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = NotesViewModel()
    @State private var showAddNoteView = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.notes) { note in
                NavigationLink {
                    NoteDetailView(note: note)
                } label: {
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
            }
            .navigationTitle("Weather Notes")
            .toolbar {
                Button {
                    showAddNoteView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddNoteView) {
                AddNoteView()
            }
        }
    }
}

#Preview {
    ContentView()
}
