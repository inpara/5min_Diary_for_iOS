//
// EditDiaryView.swift
// 5min_Diary_for_iOS
// Created on 2022/10/22.
// 
// 


import SwiftUI

struct EditDiaryView: View {
    private var diary:Diary
    @Environment(\.managedObjectContext) private var viewContext
    @State private var content: String
    @State private var stringCreatedAt: String
    private var updatedAt:Date

    
    //diaryの初期化
    init(diary:Diary){
        self.diary = diary
//        self.content = diary.content ?? ""
//        self.stringCreatedAt = diary.stringCreatedAt
        _content = State(initialValue: diary.content ?? "")
        _stringCreatedAt = State(initialValue: diary.stringCreatedAt)
        self.updatedAt = diary.updatedAt ?? Date()
    }
    
    var body: some View {
        VStack{
            TextField("作成日",text:$stringCreatedAt)
                .font(.title)
            TextEditor(text: $content)//'$'記号は、状態変数(@State)の参照を渡している
                .font(.body)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action:{saveDiary()}){
                    Text("保存")
                }
            }
        }
    }
    
    private func saveDiary(){
        diary.content = content
        diary.updatedAt = Date()
        
        try? viewContext.save()
    }
}

struct EditDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        EditDiaryView(diary: Diary())
    }
}
