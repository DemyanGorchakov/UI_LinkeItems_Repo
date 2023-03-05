//
//  Model.swift
//  UI_Notes_App
//
//  Created by Демьян Горчаков on 04.03.2023.
//

import Foundation
import RealmSwift

class LinkItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String = ""
    @Persisted var url: String = ""
}
