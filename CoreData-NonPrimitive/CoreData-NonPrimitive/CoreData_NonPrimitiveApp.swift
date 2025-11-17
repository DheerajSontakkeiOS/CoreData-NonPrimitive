//
//  CoreData_NonPrimitiveApp.swift
//  CoreData-NonPrimitive
//
//  Created by MOBILE HUTT on 17/11/25.
//

import SwiftUI

@main
struct CoreData_NonPrimitiveApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
