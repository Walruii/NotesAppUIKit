//
//  NoteManager.swift
//  NotesApp
//
//  Created by Inderpreet Bhatti on 07/11/24.
//

import UIKit
import CoreData


struct NoteManager {
    private var notesArray = [Note]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func getCount() -> Int {
        return notesArray.count
    }
    
    func getNoteByIndex(_ index: Int) -> Note {
        return notesArray[index]
    }

    func getNoteTitleByIndex(_ index: Int) -> String {
        return notesArray[index].title!
    }
    
    func getNoteContentByIndex(_ index: Int) -> String {
        return notesArray[index].content!
    }
    
    mutating func deleteAtIndex(_ index: Int) {
        context.delete(notesArray[index])
        notesArray.remove(at: index)
        saveNote()
    }
    
    mutating func loadNotes() {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        
        do {
            notesArray = try context.fetch(request)
        } catch {
            print("error geting notes \(error)")
        }
    }
   
    func saveNote() {
        do {
            try context.save()
        } catch {
            print("error saving notes \(error)")
        }
        
    }

    
}
