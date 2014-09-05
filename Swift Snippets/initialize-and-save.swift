        //Creating an object
        let car: CMCar = CMCar(objectID: "myID");
        //setting its properties
        car.year = 2014;
        car.model = "Model S"
        car.make = "Tesla"

        //saving the object
        car.save {
            (response : CMObjectUploadResponse!) -> Void in
            NSLog("Object was uploaded successfully! %@", response.uploadStatuses)
        }
