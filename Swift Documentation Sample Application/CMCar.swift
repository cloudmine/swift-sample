import CloudMine

//CMCar is a CMObject Subclass example

class CMCar: CMObject {
    dynamic var model: String?
    dynamic var make: String?
    dynamic var year: NSNumber?
    dynamic var currentLocation: CMGeoPoint?

    override init() {
        super.init()
    }

    override init(objectId theObjectId: String!) {
        super.init(objectId: theObjectId)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        make = aDecoder.decodeObjectForKey("make") as? String
        model = aDecoder.decodeObjectForKey("model") as? String
        year = aDecoder.decodeObjectForKey("year") as? NSNumber
    }

    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)

        aCoder.encodeObject(make, forKey: "make")
        aCoder.encodeObject(model, forKey: "model")
        aCoder.encodeObject(year, forKey: "year")
    }
}
