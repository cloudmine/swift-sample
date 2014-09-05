        CMStore.defaultStore().allObjectsOfClass(CMCar.self, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
