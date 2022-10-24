//
    // Created on 2022/09/30.
    // 
    

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(//データの検索//@FetchRequestを使ってプロパティを宣言すると、プロパティに検索結果が格納されるとともに、データの変更に応じて検索結果が常に最新に保たれます
        entity: Diary.entity(),//検索対象のEntityを指定
        sortDescriptors: [NSSortDescriptor(keyPath: \Diary.createdAt, ascending: false)],//ソート順
        predicate: nil,//抽出条件
        animation: .default)
    private var diaries: FetchedResults<Diary>

    var body: some View {
        NavigationView {
            List {
                ForEach(diaries) { diary in
                    NavigationLink(destination: EditDiaryView(diary: diary)) {
                        HStack{
                            Text(diary.stringCreatedAt)
                                .font(.headline)
//                                .frame(maxWidth: .infinity)
                            Spacer()
                            Text(diary.content ?? "")
                                .font(.caption)
                        }
                    }
                }
                .onDelete(perform: deleteDiary)//Listの行削除時に呼び出す処理の指定
            }
            .navigationTitle("Diary")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: AddDiaryView()){
                        Text("+")
                            .font(.system(size: 50))
                    }
                }
            }
        }
    }
    
    //削除時の処理
    private func deleteDiary(offsets:IndexSet){//offsetsには削除対象の要素番号のコレクションが渡される
        offsets.forEach{index in
            viewContext.delete(diaries[index])//ManagedObjectContextのdelete()メソッドを呼び出し
        }
        //削除結果を保存
        try? viewContext.save()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
