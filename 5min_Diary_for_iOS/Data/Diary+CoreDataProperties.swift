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
    public var wrappedContent:String{content ?? ""}//nil coalescing operator(??演算子)//左辺のnilチェックをし、nilであれば右辺を使う
    public var wrappedCreatedAt:Date{createdAt ?? Date()}
    public var wrappedUpdatedAt:Date{updatedAt ?? Date()}
    public var wrappedId:UUID{id ?? UUID()}
}


extension Diary : Identifiable {
    //createdAtの日付をString型に変換
    public var stringCreatedAt:String{dateFormatter(date:createdAt ?? Date())}
    
    //Date型のフォーマットを整える
    func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")

        return dateFormatter.string(from: date)
    }

}
