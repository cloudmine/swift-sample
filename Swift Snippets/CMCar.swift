//
//  CMCar.swift
//  Swift Documentation Sample Application
//
//  Created by Charles Burnett on 9/2/14.
//  Copyright (c) 2014 CloudMine. All rights reserved.
//

//CMCar is a CMObject Subclass example

class CMCar: CMObject {
    var model: String?
    var make: String?
    var year: Int?
    var currentLoc: CMGeoPoint?
        override func encodeWithCoder(aCoder: NSCoder!) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeObject(make!, forKey: "make")
        aCoder.encodeObject(model!, forKey: "model")
        aCoder.encodeInteger(year!, forKey: "year")
    }
    init(objectID objID: NSString!) {
        super.init(objectId: objID)
    }

    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        make = aDecoder.decodeObjectForKey("make") as NSString!
        model = aDecoder.decodeObjectForKey("model") as NSString!
        year = aDecoder.decodeIntegerForKey("year") as Int!
    }

}
