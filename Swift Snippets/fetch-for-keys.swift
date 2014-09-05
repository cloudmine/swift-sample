        let keys = ["ObjectID","secondObjectID"]
        CMStore.defaultStore().objectsWithKeys(keys, additionalOptions: nil)
            {
                (response : CMObjectFetchResponse!) in
                println("JSON: " + response.description)
        }
