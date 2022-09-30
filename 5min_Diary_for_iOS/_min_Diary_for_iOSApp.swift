//
    // Created on 2022/09/30.
    // 
    

import SwiftUI

@main
struct _min_Diary_for_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
