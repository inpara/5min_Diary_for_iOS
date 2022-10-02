//
    // Created on 2022/09/30.
    // 
    
// containerを作成
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {//プレビュー用DB設定
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        //プレビュー用初期値設定//後程、自アプリ用に書き換える
//        for _ in 0..<10 {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {//構造体PersistenceControllerのインスタンス生成時に呼び出される(初期値の設定)
        container = NSPersistentContainer(name: "_min_Diary_for_iOS")//NSPersistentContainerのインスタンスを生成して定数に格納//引数にはModelDataファイル名を入れる
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in//loadPersistentStoresメソッド:PersistentStoreを読み込み、作成したことがない場合は作成する
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")//PersistentStoreの読み込みでエラーが発生した際はアプリを落とす
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
