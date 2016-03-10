package rest

import cars.Car
import cars.Owner
import grails.converters.JSON
import grails.plugins.rest.client.RestBuilder
import grails.plugins.rest.client.RestResponse
import grails.test.spock.IntegrationSpec


class CarControllerFunctionalSpec extends IntegrationSpec{

    //grails test -Dserver.port=8090 run-app
    def setup() {
    }

    def cleanup() {
    }

    void "test creating and listing cars"() {
        given:
        RestBuilder rest = new RestBuilder()

        RestResponse response1 = rest.post("http://localhost:8090/cars/api/owners/") {
            json([
                    dni: 11222333, lastName: "Smith", name: "Willy", nationality: "American"
            ])
            accept(JSON)
        }

        def ownerSaved = Owner.findByDni(11222333)

        RestResponse response2 = rest.post("http://localhost:8090/cars/api/cars/") {
            json([
                  year: 2011, make: "Ford", model: "Fiesta", plate: "AAA999", idOwner: ownerSaved.id
            ])
            accept(JSON)
        }

        RestResponse response3 = rest.post("http://localhost:8090/cars/api/cars/") {
            json([
                  year: 2013, make: "Ford", model: "Mondeo", plate: "BBB998", idOwner: ownerSaved.id
            ])
            accept(JSON)
        }

        println("resp 1 : " + response1.json + "resp 2 : " + response2.json + "resp 3 : " + response3.json)

        when:
        RestResponse response = rest.get("http://localhost:8090/cars/api/cars?currentPage=1&year=&make=&model=&plate=") {
            accept(JSON)
        }

        println("the response is : " + response.json)
        then:
        assert response.status == 200
        assert response.json.content.cantItems[0] == 2
    }

}
