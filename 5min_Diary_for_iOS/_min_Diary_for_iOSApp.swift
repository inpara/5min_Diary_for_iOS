//
    // Created on 2022/09/30.
    // 
    

import SwiftUI

@main
struct _min_Diary_for_iOSApp: App {
    let persistenceController = PersistenceController.shared//PersistentContainerのインスタンスを生成

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)//ContentViewの環境変数に、containerのcontextを格納//第一引数:環境変数のkeypath,第二引数:格納する値
        }
    }
}
