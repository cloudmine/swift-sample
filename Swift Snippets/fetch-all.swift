        CMStore.defaultStore().allObjectsWithOptions(nil)
            {
            (response : CMObjectFetchResponse!) in
            println("JSON: " + response.description)
        }
