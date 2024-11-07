//
//  NotesMenuController.swift
//  NotesApp
//
//  Created by Inderpreet Bhatti on 07/11/24.
//

import UIKit

class NotesMenuController: UITableViewController {
    
    var noteManager = NoteManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up reusable Cell and registering it
        let nib =  UINib(nibName: "Note", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoteCell")
        
        noteManager.loadNotes()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        noteManager.loadNotes()
        tableView.reloadData()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowNote") {
            let vc = segue.destination as! NoteViewController
            if let index = tableView.indexPathForSelectedRow?.row {
                vc.note = noteManager.getNoteByIndex(index)
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return noteManager.getCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteCellController
        cell.title.text = noteManager.getNoteTitleByIndex(indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowNote", sender: self)
    }
    
}
