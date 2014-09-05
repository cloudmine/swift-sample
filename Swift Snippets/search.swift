        CMStore.defaultStore().searchObjects("[\"Tesla\"]", additionalOptions: nil) {
            (response : CMObjectFetchResponse!) in
            println("JSON: " + response.description)
        }
