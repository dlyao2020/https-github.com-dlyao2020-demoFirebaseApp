//
//  ViewTask.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import SwiftUI

struct ViewTask: View {
    var task: Task
    @EnvironmentObject var dataManager: DataManager


    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(task.title)
            Text(task.description)
            Text("\(task.quantity)")
            if (task.completed == false) {Text("false")}
            else {Text("true")}
        }
            .navigationBarTitle(task.title)
    }
}

//#Preview {
//    ViewTask()
//        .environmentObject(DataManager())
//}
