//
//  ViewController.swift
//  Swift Documentation Sample Application
//
//  Created by Charles Burnett on 8/28/14.
//  Copyright (c) 2014 CloudMine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating an object
        let car: CMCar = CMCar();
        //setting its properties
        car.year = 2014;
        car.model = "Model S"
        car.make = "Tesla"
        
        //saving the object
        car.save {
            (response : CMObjectUploadResponse!) -> Void in
            NSLog("Object was uploaded successfully! %@", response.uploadStatuses)
        }
        
        CMStore.defaultStore().searchObjects("[\"Tesla\"]", additionalOptions: nil) {
            (response : CMObjectFetchResponse!) in
            println("JSON: " + response.description)
        }
        
        CMStore.defaultStore().allObjectsWithOptions(nil)
            {
            (response : CMObjectFetchResponse!) in
            println("JSON: " + response.description)
        }
        
        CMStore.defaultStore().allObjectsOfClass(CMCar.self, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
        let keys = ["ObjectID","secondObjectID"]
        CMStore.defaultStore().objectsWithKeys(keys, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
        
        CMStore.defaultStore().deleteObject(car, additionalOptions: nil)
            {
                (response : CMDeleteResponse!) in
                println("JSON: " + response.description)
        }
        
        
        car.currentLocation = CMGeoPoint(latitude: 30, andLongitude: 30)
        CMStore.defaultStore().searchObjects("[currentLoc near (30,30)]", additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

