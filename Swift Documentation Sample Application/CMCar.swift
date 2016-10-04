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

        make = aDecoder.decodeObject(forKey: "make") as? String
        model = aDecoder.decodeObject(forKey: "model") as? String
        year = aDecoder.decodeObject(forKey: "year") as? NSNumber
        currentLocation = aDecoder.decodeObject(forKey: "currentLocation") as? CMGeoPoint
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)

        aCoder.encode(make, forKey: "make")
        aCoder.encode(model, forKey: "model")
        aCoder.encode(year, forKey: "year")
        aCoder.encode(currentLocation, forKey:"currentLocation")
    }
}
