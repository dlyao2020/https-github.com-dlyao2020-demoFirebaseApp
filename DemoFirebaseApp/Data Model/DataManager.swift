//
//  DataManager.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var tasks: [Task] = []
    var firebaseCollection = "tasklist" // REPLACE WITH YOUR COLLECTION NAME
    
    init() {
        fetchTasklist()
    }
    
    func fetchTasklist() {
        tasks.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection(firebaseCollection)
        ref.getDocuments {snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = document.documentID
                    //DEFINE YOUR FIREBASE FIELDS TO PULL
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let completed = data["completed"] as? Bool ?? false
                    let quantity = data["quantity"] as? Int ?? 0
                    //MAKE SURE YOU UPDATE THE FIELDS HERE
                    let task = Task(id: id, title: title, completed: completed, description: description, quantity: quantity)
                    self.tasks.append(task)
                }
            }
        }
    }
    
    func addTask(newTask: String, addDescription: String) {
        let db = Firestore.firestore()
        let ref = db.collection(firebaseCollection)
        ref.addDocument(data: [
            //FIELDS DEFINED TO BE ADDED
            "title": newTask,
            "description": addDescription,
            "completed" : false
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
            //reload data
            self.fetchTasklist()
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        // Delete the item from Firebase
        let item = tasks[offsets.first!]
        let db = Firestore.firestore()
        db.collection(firebaseCollection).document(item.id).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            }
        }
        // Reload the data
        self.fetchTasklist()
    }
}

