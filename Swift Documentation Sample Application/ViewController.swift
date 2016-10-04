import UIKit
import CloudMine

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Creating an object
        let car: CMCar = CMCar();
        //setting its properties
        car.year = 2014;
        car.model = "Model S"
        car.make = "Tesla"
        
        //saving the object
        car.save {
            (response : CMObjectUploadResponse!) -> Void in
            print("[CMSAMPLE] Object was uploaded successfully! %@", response.uploadStatuses)
        }
        
        CMStore.defaultStore().searchObjects("[\"Tesla\"]", additionalOptions: nil) {
            (response : CMObjectFetchResponse!) in
            print("[CMSAMPLE]  JSON: " + response.description)
        }
        
        CMStore.defaultStore().allObjectsWithOptions(nil)
            {
            (response : CMObjectFetchResponse!) in
            print("[CMSAMPLE] JSON: " + response.description)
        }
        
        CMStore.defaultStore().allObjectsOfClass(CMCar.self, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                print("[CMSAMPLE] JSON: " + response.description)
        }
        let keys = ["ObjectID","secondObjectID"]
        CMStore.defaultStore().objectsWithKeys(keys, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                print("[CMSAMPLE] JSON: " + response.description)
        }
        
        CMStore.defaultStore().deleteObject(car, additionalOptions: nil)
            {
                (response : CMDeleteResponse!) in
                print("[CMSAMPLE] JSON: " + response.description)
        }
        
        
        car.currentLocation = CMGeoPoint(latitude: 30, andLongitude: 30)
        CMStore.defaultStore().searchObjects("[currentLoc near (30,30)]", additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                print("[CMSAMPLE] JSON: " + response.description)
        }
    }
}

