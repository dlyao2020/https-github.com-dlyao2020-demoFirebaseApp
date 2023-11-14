//
//  DemoFirebaseAppApp.swift
//  DemoFirebaseApp
//
//  Created by Daniel Yao on 11/13/23.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct DemoFirebaseApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
                    .environmentObject(dataManager)
            }
        }
    }
}
