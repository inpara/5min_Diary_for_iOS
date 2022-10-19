//
// AddDiary.swift
// 5min_Diary_for_iOS
// Created on 2022/10/18.
// 
// 


import SwiftUI

struct AddDiary: View {
    @Environment(\.managedObjectContext) private var viewcontext
    @Environment(\.presentationMode) var presentation//環境変数の取得
    @State private var content: String = ""
    
    var body: some View {
        VStack{
            TextEditor(text: $content)
                .font(.body)
            Spacer()
        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action:{addDiary()}){
                        Text("保存")
                    }
                }
            }
    }
    
    private func addDiary(){
        let diary = Diary(context: viewcontext)
        diary.id = UUID()
        diary.content = content
        diary.createdAt = Date()
        diary.updatedAt = Date()
        
        try? viewcontext.save()//生成したインスタンスをCoreDataに保存//"try?"がよくわからない。
        
        //presentationModeにアクセスするにはwrappedValueを使う
        //dismiss()で、現在のviewを閉じる
        presentation.wrappedValue.dismiss()
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiary()
    }
}
