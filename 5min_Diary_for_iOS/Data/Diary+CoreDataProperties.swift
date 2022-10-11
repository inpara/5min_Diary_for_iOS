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

}

extension Diary : Identifiable {

}
