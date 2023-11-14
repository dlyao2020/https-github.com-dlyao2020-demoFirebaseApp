//
//  ListView.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false

    var body: some View {
        //Version 1
        VStack {
            NavigationView {
                List {
                    Section(header: Text("Important Tasks")) {
                        ForEach(dataManager.tasks, id: \.self) { task in
                            NavigationLink {
                                ViewTask(task: task)
                            } label: {
                                Text(task.title)
                            }
                        }
                        .onDelete(perform: dataManager.deleteItem)
                    }
                }
                .navigationTitle("To Do")
                .toolbar {EditButton()}
                .navigationBarItems(trailing:
                    Button(action: {
                    showPopup.toggle()
                    // add
                }, label: {
                    Image(systemName: "plus")
                }))
                .sheet(isPresented: $showPopup) {
                    AddTask()
                }
            }
//            List {
//                Section(header: Text("Non-Important Tasks")) {
//                    ForEach(dataManager.tasks, id: \.self) { task in
//                        NavigationLink {
//                            ViewTask(task: task)
//                        } label: {
//                            Text(task.title)
//                        }
//                    }
//                    .onDelete(perform: dataManager.deleteItem)
//                }
//            }

        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager())
}
