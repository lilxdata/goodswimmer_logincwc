//
//  List.swift
//  goodswimmer
//
//  Created by Alex Echeverria on 12/28/20.
//  Copyright © 2020 madi. All rights reserved.
//
 
import Foundation
import FirebaseDatabase
import FirebaseFirestore

struct List {
    
    var username: String?
    var userId: String?
    var followers: [String?]
    var description: String?
    var events: [String?]
    var places: [String?]
    private var createdDate: Timestamp?
}

