//
// Diary+CoreDataProperties.swift
// 5min_Diary_for_iOS
// Created on 2022/10/11.
// 
// エンティティの属性情報を定義するファイル

//

import Foundation
import CoreData


extension Diary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary> {
        return NSFetchRequest<Diary>(entityName: "Diary")
    }

    @NSManaged public var content: String?
    @NSManaged public var create_date: Date?
    @NSManaged public var id: UUID?

}

//値がnilの場合のデフォルト値定義
extension Diary{
    public var wrappedContent:String{content ?? ""}
    public var wrappedCreate_date:Date{create_date ?? Date()}
    public var wrappedId:UUID{id ?? UUID()}
}


extension Diary : Identifiable {

}
