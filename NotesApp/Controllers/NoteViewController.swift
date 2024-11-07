//
//  NoteViewController.swift
//  NotesApp
//
//  Created by Inderpreet Bhatti on 07/11/24.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var contentLabel: UITextView!
    
    var note: Note?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = note {
            titleLabel.text = note.title
            contentLabel.text = note.content
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        if (note == nil) {
            note = Note(context: context)
            note?.date_created = Date()
        }
        if let title = titleLabel.text, let content = contentLabel.text, let safeNote = note {
            safeNote.title = title
            safeNote.content = content
            
            let alert = UIAlertController(title: "Success", message: "Note Saved!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(alertAction)
            
            if !saveNote() {
                alert.title = "Failure"
                alert.message = "Note Could Not Be Saved!"
            }
            present(alert, animated: true)
        }
    }
    
    func saveNote() -> Bool {
        do {
            try context.save()
            return true
        } catch {
            print("error saving notes \(error)")
            return false
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
