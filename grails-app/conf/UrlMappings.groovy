class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(resources: "Car")
        "/owner"(resources: "Owner")
        "500"(view:'/error')

        "/api/cars"(resources: "CarRest")
        "/api/owners"(resources: "OwnerRest")
	}
}
