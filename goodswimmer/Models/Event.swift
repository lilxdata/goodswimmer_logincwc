//
//  Event.swift
//  goodswimmer
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseFirestore

//event structure featuring all of the event data we need, title, date etc from firebase data
//TODO: update struct after db design implemented for events
struct Event {
    
    var name:String?
    var venue: String?
    var address:String?
    var description:String?
    var username:String?
    var date:String?
  //  var dateStart: String?
    var startDate: Timestamp?
    var endDate: Timestamp?
  //  var startTime: Timestamp?
   // var endTime: Timestamp?
    var photoURL:String?
    var time: String?
    var userId: String? //todo
    var attendees: [Attendee]?
    
    init?(eventDict: [String: Any]) {
        let name = eventDict["name"] as? String
        let venue = eventDict["location"] as? String
        let username = eventDict["username"] as? String
        let description = eventDict["description"] as? String
        let startDate = eventDict["start_date"] as? Timestamp
        let endDate = eventDict["end_date"] as? Timestamp
 //       let startTime = eventDict["start_time"] as? Timestamp
   //     let endTime = eventDict["end_time"] as? Timestamp
        //  let imageHeight = dict["image_height"] as? CGFloat,
        //  let createdAgo = dict["created_at"] as? TimeInterval
        self.username = username
        self.name = name
        self.venue = venue
   //     self.dateStart = dateStart
        self.photoURL = eventDict["photoURL"] as? String
        self.endDate = endDate
        self.description = description
        self.startDate = startDate
 //       self.startTime = startTime
   //     self.endTime = endTime
    }
}
