//
// AddDiary.swift
// 5min_Diary_for_iOS
// Created on 2022/10/18.
// 
// 


import SwiftUI

struct AddDiary: View {
    @Environment(\.managedObjectContext) private var viewcontext
    @Environment(\.isPresented) var isPresented//環境変数isPresented:現在の画面が他の画面から呼び出されたのか否かをbool値で表す
    @Environment(\.dismiss) var dismiss//環境変数dismiss:現在の画面を閉じる,現在の画面がTopViewである場合は効果はない
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
        
        if isPresented{
            //現在の画面が他の画面から呼び出されたものである場合
            dismiss()//現在の画面を閉じる
        }
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiary()
    }
}
