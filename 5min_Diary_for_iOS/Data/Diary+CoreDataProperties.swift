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
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var id: UUID?

}

//値がnilの場合のデフォルト値定義
extension Diary{
    public var wrappedContent:String{content ?? ""}
    public var wrappedCreatedAt:Date{createdAt ?? Date()}
    public var wrappedUpdatedAt:Date{updatedAt ?? Date()}
    public var wrappedId:UUID{id ?? UUID()}
}


extension Diary : Identifiable {

}
