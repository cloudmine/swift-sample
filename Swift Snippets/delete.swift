        CMStore.defaultStore().deleteObject(car, additionalOptions: nil)
            {
                (response : CMDeleteResponse!) in
                println("JSON: " + response.description)
        }
