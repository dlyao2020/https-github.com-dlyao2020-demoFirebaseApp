//
//  AddTask.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import SwiftUI

struct AddTask: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var addTask = ""
    @State private var addDescription = ""
    @Environment(\.presentationMode) var presentationMode
    //    @State private var showPopup = false

    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack(spacing: 20) {
                TextField("title", text: $addTask)
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("description", text: $addDescription)
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button {
                    dataManager.addTask(newTask: addTask, addDescription: addDescription)
                    //reverts back to previous view; currently add is presented as modal
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 6)
//                        .cornerRadius(3.0)
                        .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(.gray)
//                            .stroke(.pink, lineWidth: 1)
                        )
                        .overlay {
                            (RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(.white, lineWidth: 1)
                            )}
                }
//                .background(Color(red: 255, green: 255, blue: 255))
                //.clipShape(Capsule())
//                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .buttonStyle(.bordered)
                .controlSize(.mini)
            }
            .padding()
//            .background(Color(red: 0.0, green: 1.0, blue: 1.0))
        }
    }
}

#Preview {
    AddTask()
}
