//
//  A2_iOS_Oleg_101447469App.swift
//  A2_iOS_Oleg_101447469
//
//  Created by Nadia Rukhlia on 2025-03-28.
//

import SwiftUI

@main
struct A2_iOS_Oleg_101447469App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
