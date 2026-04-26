//
//  Note.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import Foundation

struct Note: Identifiable {
    let id: UUID
    let title: String
    let text: String
    let date: Date
    let city: String
    let temperature: Int
    let weatherDescription: String
    let icon: String
}
