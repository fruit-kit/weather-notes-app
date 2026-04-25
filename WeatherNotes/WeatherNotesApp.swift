//
//  WeatherNotesApp.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

import SwiftUI
internal import CoreData

@main
struct WeatherNotesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
