//
    // Created on 2022/09/30.
    // 
    

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext//環境変数managedObjectContextを取得し、viewContextに格納

    @FetchRequest(//データを要求
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],//sortDescriptors:取得したデータの並び順を指定
        animation: .default)
    private var items: FetchedResults<Item>//取得結果を変数に格納<Entity名>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")//itemFormatterの定義は後述
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)// 配列FetchedResultsから要素を削除する際に呼び出す処理を指定//deleteItemsの定義は後述
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {//plusボタンが押されたときの処理を指定,addItemの定義は後述
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    //新規レコードの作成
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)//Entity名(context:context名)
            newItem.timestamp = Date()

            do {
                try viewContext.save()//データを保存
            } catch {//エラーを返した場合以下を実行
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    //行の削除
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()//削除状態をコミット
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)//プレビュー用に環境変数の値を設定
    }
}
