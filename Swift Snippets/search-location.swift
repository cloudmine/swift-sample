        car.currentLoc = CMGeoPoint(latitude: 30, andLongitude: 30)
        CMStore.defaultStore().searchObjects("[currentLoc near (30,30)]", additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
