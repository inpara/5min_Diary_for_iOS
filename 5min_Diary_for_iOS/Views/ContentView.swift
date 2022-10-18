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
                    NavigationLink {
                        Text(diary.content!)
                    } label: {
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
            }
            .navigationTitle("Diary")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: AddDiary()){
                        Text("+")
                            .font(.system(size: 50))
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
