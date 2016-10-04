import UIKit
import CloudMine

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a car object and set its properties
        let car: CMCar = CMCar()
        car.year  = 2014
        car.model = "Model S"
        car.make  = "Tesla"
        car.currentLocation = CMGeoPoint(latitude: 30, andLongitude: 30)
        
        // Sample Actions: A series of calls demonstrating the SDKs capabilities
        // These are nested so they occur one after another; in a real codebase, different
        // calls would be used appropriately during the lifecycle of the application.
        car.save { (response: CMObjectUploadResponse!) in
            print("[CMSAMPLE] Object was uploaded successfully! \(response.uploadStatuses)")

            CMStore.defaultStore().searchObjects("[\"Tesla\"]", additionalOptions: nil) { (response: CMObjectFetchResponse!) in
                print("[CMSAMPLE] Search Results: \(response)")

                CMStore.defaultStore().allObjectsWithOptions(nil) { (response : CMObjectFetchResponse!) in
                    print("[CMSAMPLE] All Objects: \(response)")

                    CMStore.defaultStore().allObjectsOfClass(CMCar.self, additionalOptions: nil) { (response: CMObjectFetchResponse!) in
                        print("[CMSAMPLE] All Car Objects: \(response)")

                        let keys = ["ObjectID","secondObjectID"]
                        CMStore.defaultStore().objectsWithKeys(keys, additionalOptions: nil) { (response: CMObjectFetchResponse!) in
                            print("[CMSAMPLE] Fetched with keys: \(response)")

                            CMStore.defaultStore().searchObjects("[currentLoc near (30,30)]", additionalOptions: nil) { (response: CMObjectFetchResponse!) in
                                print("[CMSAMPLE] Location Search: \(response)")

                                CMStore.defaultStore().deleteObject(car, additionalOptions: nil) { (response: CMDeleteResponse!) in
                                    print("[CMSAMPLE] Delete Car: \(response)")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
