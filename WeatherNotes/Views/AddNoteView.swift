//
//  AddNoteView.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//
import SwiftUI

struct AddNoteView: View {
    
    let onSave: (String, String, String) -> Void
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var text: String = ""
    @State private var city: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("City")
                    .font(.headline)
                TextField("City", text: $city)
                    .textFieldStyle(.roundedBorder)
                
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
                        onSave(title, text, city)
                        dismiss()
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
    AddNoteView { title, text, city in
        print(title, text)
    }
}
