//
//  NotesStorageService.swift
//  WeatherNotes
//
//  Created by Robert Kotrutsa on 25.04.26.
//

internal import CoreData

final class NotesStorageService {
    
    private let context = PersistenceController.shared.container.viewContext
    
    func save(note: Note) {
        let entity = NoteEntity(context: context)
        
        entity.id = note.id
        entity.title = note.title
        entity.text = note.text
        entity.date = note.date
        entity.temperature = Int16(note.temperature)
        entity.weatherDescription = note.weatherDescription
        entity.icon = note.icon
        
        do {
            try context.save()
        } catch {
            print("Failed to save to Core Data:", error.localizedDescription)
        }
    }
    
    func fetchNotes() -> [Note] {
        let request = NoteEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "date", ascending: false)
        ]
        
        do {
            let result = try context.fetch(request)
            
            return result.map { entity in
                Note(id: entity.id ?? UUID(),
                     title: entity.title ?? "",
                     text: entity.text ?? "",
                     date: entity.date ?? Date(),
                     temperature: Int(entity.temperature),
                     weatherDescription: entity.weatherDescription ?? "",
                     icon: entity.icon ?? "questionmark.circle")
            }
        } catch {
            print("CoreData fetch error:", error)
            return []
        }
    }
    
}
