//
//  AddNoteView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//
import SwiftUI

struct AddNoteView: View {
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Title")
                    .font(.headline)
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                Text("Description")
                    .font(.headline)
                    TextEditor(text: $text)
                        .frame(height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.gray.opacity(0.3))
                        }
                HStack {
                    Spacer()
                    Button("Save") {
                        print("Title: \(title)")
                        print("Description: \(text)")
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Add Note")
        }
    }
}

#Preview {
    AddNoteView()
}
