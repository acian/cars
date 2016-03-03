package rest

import cars.Owner
import groovy.json.JsonBuilder

class OwnerRestController {

    static responseFormats = ['json']

    def ownerService

    def index() {
        params.max = new Integer(10)
        params.sort = "id"
        params.order = "desc"
        params.offset = (new Integer(params.currentPage)-1)*params.max

        def ownerList = ownerService.findAll(params)
        def ownerCount = ownerService.countAll(params);

        def json = new JsonBuilder()
        def root = json {
            "cantItems" ownerCount

            "items" ownerList.collect {item ->
                ["id":item.id,
                 "dni":item.dni,
                 "lastName":item.lastName,
                 "name":item.name,
                 "nationality":item.nationality
                ]
            }
        }

        respond json;
    }

    def show() {
        respond ownerService.getById(params.id)
    }

    def create() {
        respond new Owner(params)
    }

    def save() {
        Owner own = request.JSON;
        own.setId(null);
        own = ownerService.saveOwner(own)

        if(!own.hasErrors())
            respond status: 201
    }

    def update(Owner own) {
        Owner own2 = request.JSON;

        own.setDni(own2.getDni());
        own.setLastName(own2.getLastName());
        own.setName(own2.getName());
        own.setNationality(own2.getNationality());

        own = ownerService.saveOwner(own);

        if(!own.hasErrors())
            respond status: 201
    }

    def delete(Owner own) {
        ownerService.deleteOwner(own)
        respond status: 201
    }
}