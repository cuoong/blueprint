//
//  blueprintApp.swift
//  Shared
//
//  Created by cuong on 3/16/22.
//

import SwiftUI

@main
struct blueprintApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
