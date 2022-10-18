//
// AddDiary.swift
// 5min_Diary_for_iOS
// Created on 2022/10/18.
// 
// 


import SwiftUI

struct AddDiary: View {
    @Environment(\.managedObjectContext) private var viewcontext
    @Environment(\.presentationMode) var presentation
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
        //ここに処理を記載
    }
}

struct AddDiary_Previews: PreviewProvider {
    static var previews: some View {
        AddDiary()
    }
}
